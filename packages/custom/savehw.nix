{pkgs}:
pkgs.writeShellApplication {
  name = "savehw";
  runtimeInputs = with pkgs; [
    dig
    dmidecode
    drm_info
    eza
    glxinfo
    kmod
    lm_sensors
    lshw
    pciutils
    smartmontools
    systemd
    usbutils
    util-linux
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

    lscpu > dump/lscpu 2>&1
    lscpu -e > dump/lscpu-extended 2>&1
    cat /proc/cpuinfo > cpuinfo 2>&1
    sensors > dump/sensors 2>&1

    lsmem > dump/lsmem 2>&1
    cat /proc/meminfo > meminfo 2>&1  

    lspci -vvv > dump/lspci 2>&1
    lsusb -v > dump/lsusb 2>&1
    lsblk -f > dump/lsblk 2>&1
    fdisk -l > dump/fdisk 2>&1
    cat /proc/scsi/scsi > scsi 2>&1

    udevadm info -e > dump/udevadm-info 2>&1
    dmidecode > dump/dmidecode 2>&1

    lshw > dump/lshw 2>&1
    lshw -short > dump/lshw-short 2>&1
    lshw -json > dump/lshw-json 2>&1

    inxi -iFv8 > dump/inxi-iFv8 2>&1
    inxi -iFv8 --output json --output-file "$(pwd)/inxi-iFv8-json" > dump/inxi-iFv8-json.log 2>&1
    inxi -iFv8 --output xml --output-file "$(pwd)/inxi-iFv8-xml" > dump/inxi-iFv8-xml.log 2>&1

    drm_info > dump/drm_info 2>&1
    drm_info -j > dump/drm_info-json 2>&1
    glxinfo > dump/glxinfo 2>&1

    eza --icons=always --no-permissions --no-user --no-time -lT /dev > dump/dev 2>&1
    eza --icons=always --no-permissions --no-user --no-time -lT /sys/class > dump/sys-class 2>&1

    mkdir smartctl
    for device in $(lsblk -l -oNAME | tail -n+2); do
        smartctl -x "/dev/$device" > "smartctl/$device" 2>&1
    done

    lsmod > dump/lsmod 2>&1

    cd ..
    echo "done!"
  '';
}
