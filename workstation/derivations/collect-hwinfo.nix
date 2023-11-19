{ pkgs }:

pkgs.writeShellApplication {
  name = "collect-hwinfo";
  text = ''
    if [ "$EUID" -ne 0 ]
      then echo "Please run as root!"
      exit 1
    fi

    folder="hwinfo_$(date +'%Y-%b-%d_%H-%M-%S' | tr '[:upper:]' '[:lower:]')"
    mkdir "$folder"
    cd "$folder"
    mkdir smartctl
    set -x

    ${pkgs.util-linux}/bin/lscpu > lscpu 2>&1
    ${pkgs.util-linux}/bin/lscpu -e > lscpu-extended 2>&1
    cat /proc/cpuinfo > cpuinfo

    ${pkgs.util-linux}/bin/lsmem > lsmem 2>&1
    cat /proc/meminfo > meminfo

    ${pkgs.pciutils}/bin/lspci -vvv > lspci 2>&1

    ${pkgs.usbutils}/bin/lsusb -v > lsusb 2>&1

    ${pkgs.dmidecode}/bin/dmidecode > dmidecode 2>&1

    ${pkgs.util-linux}/bin/lsblk -f > lsblk 2>&1
    ${pkgs.util-linux}/bin/fdisk -l > fdisk 2>&1
    cat /proc/scsi/scsi > scsi

    ${pkgs.lshw}/bin/lshw > lshw 2>&1
    ${pkgs.lshw}/bin/lshw --short > lshw-short 2>&1

    ${pkgs.eza}/bin/eza --icons=always --no-permissions --no-user --no-time -lT /sys/class > sys-class

    for device in $(${pkgs.util-linux}/bin/lsblk -l -oNAME | tail -n+2); do
        ${pkgs.smartmontools}/bin/smartctl -x "/dev/$device" > smartctl/"$device" 2>&1
    done
    cd ..
  '';
}
