{ pkgs, writeShellApplication }:
writeShellApplication {
  name = "savehw";
  runtimeInputs = with pkgs; [
    dig
    dmidecode
    drm_info
    eza
    glxinfo
    inxi
    kmod
    lm_sensors
    lshw
    pciutils
    smartmontools
    systemd
    usbutils
    util-linux
    vulkan-tools
  ];

  text = ''
    if [ "$EUID" -ne 0 ]; then
      echo "Please run as root!"
      exit 1
    fi

    set -x
    set +o errexit
    set +o nounset
    set +o pipefail

    folder="savehw_$(date +'%Y-%b-%d_%H-%M-%S' | tr '[:upper:]' '[:lower:]')"
    mkdir "$folder"
    cd "$folder"
    mkdir dump
    cwd=$(pwd)

    lscpu > dump/lscpu 2>&1
    lscpu -e > dump/lscpu-extended 2>&1
    cat /proc/cpuinfo > dump/cpuinfo 2>&1
    sensors > dump/sensors 2>&1

    lsmem > dump/lsmem 2>&1
    cat /proc/meminfo > dump/meminfo 2>&1

    lspci -vvv > dump/lspci 2>&1
    lsusb -v > dump/lsusb 2>&1
    lsblk -f > dump/lsblk 2>&1
    fdisk -l > dump/fdisk 2>&1
    cat /proc/scsi/scsi > dump/scsi 2>&1

    udevadm info -e > dump/udevadm-info 2>&1
    dmidecode > dump/dmidecode 2>&1

    lshw > dump/lshw 2>&1
    lshw -short > dump/lshw-short 2>&1
    lshw -json > dump/lshw.json 2>&1

    inxi -iFv8 > dump/inxi-iFv8 2>&1
    inxi -iFv8 --output json --output-file "$cwd/dump/inxi-iFv8.json" > dump/inxi-iFv8.json.log 2>&1

    drm_info > dump/drm_info 2>&1
    drm_info -j > dump/drm_info-json 2>&1
    # shellcheck disable=SC2024
    sudo -u error glxinfo > dump/glxinfo 2>&1

    # shellcheck disable=SC2024
    sudo -u error DISPLAY="" vulkaninfo > dump/vulkaninfo 2>&1
    # shellcheck disable=SC2024
    sudo -u error DISPLAY="" vulkaninfo --summary > dump/vulkaninfo-summary 2>&1
    # shellcheck disable=SC2024
    sudo -u error DISPLAY="" vulkaninfo --json --output /tmp/vulkaninfo.json > dump/vulkaninfo.json.log 2>&1
    mv /tmp/vulkaninfo.json "$cwd/dump/vulkaninfo.json"
    # shellcheck disable=SC2024
    sudo -u error DISPLAY="" vulkaninfo --html --output /tmp/vulkaninfo.html > dump/vulkaninfo.html.log 2>&1
    mv /tmp/vulkaninfo.html "$cwd/dump/vulkaninfo.html"

    eza --icons=always --no-permissions --no-user --no-time -lT /dev > dump/dev 2>&1
    eza --icons=always --no-permissions --no-user --no-time -lT /sys/class > dump/sys-class 2>&1
    eza --icons=always --no-permissions --no-user --no-time -lT /sys/firmware > dump/sys-firmware 2>&1

    mkdir efivars
    for efivar in /sys/firmware/efi/efivars/*; do
      varname=$(basename "$efivar")
      head -c1048576 "$efivar" > "efivars/$varname" 2>&1
    done

    mkdir smartctl
    for device in $(lsblk -l -oNAME | tail -n+2); do
      smartctl -x "/dev/$device" > "smartctl/$device" 2>&1
    done

    lsmod > dump/lsmod 2>&1

    echo "done!"
  '';
}
