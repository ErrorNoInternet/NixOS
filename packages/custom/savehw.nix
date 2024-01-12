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

    lscpu > lscpu 2>&1
    lscpu -e > lscpu-extended 2>&1
    cat /proc/cpuinfo > cpuinfo
    sensors > sensors 2>&1

    lsmem > lsmem 2>&1
    cat /proc/meminfo > meminfo

    lspci -vvv > lspci 2>&1
    lsusb -v > lsusb 2>&1
    lsblk -f > lsblk 2>&1
    fdisk -l > fdisk 2>&1
    cat /proc/scsi/scsi > scsi

    udevadm info -e > udevadm-info 2>&1
    dmidecode > dmidecode 2>&1

    lshw > lshw 2>&1
    lshw -short > lshw-short 2>&1
    lshw -json > lshw-json 2>&1

    inxi -iFv8 > inxi-iFv8 2>&1
    inxi -iFv8 --output json --output-file "$(pwd)/inxi-iFv8-json" > inxi-iFv8-json.log 2>&1
    inxi -iFv8 --output xml --output-file "$(pwd)/inxi-iFv8-xml" > inxi-iFv8-xml.log 2>&1

    drm_info > drm_info 2>&1
    drm_info -j > drm_info-json 2>&1
    glxinfo > glxinfo 2>&1

    eza --icons=always --no-permissions --no-user --no-time -lT /dev > dev 2>&1
    eza --icons=always --no-permissions --no-user --no-time -lT /sys/class > sys-class 2>&1

    mkdir smartctl
    for device in $(lsblk -l -oNAME | tail -n+2); do
        smartctl -x "/dev/$device" > "smartctl/$device" 2>&1
    done

    lsmod > lsmod 2>&1

    cd ..
    echo "done!"
  '';
}
