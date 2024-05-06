{
  inputs',
  pkgs,
  ...
}: {
  profiles = {
    windowManager.enable = true;
    desktop = {
      enable = true;
      enableNvidia = true;
    };
  };

  desktop.monitors = [{}];

  customPrograms = {
    kdeconnect.enable = true;
    libreoffice.enable = true;
    obsStudio.enable = true;
    prismlauncher.enable = true;
    spotify.enable = true;
    thunderbird.enable = true;
    virtManager.enable = true;
    cava.enable = true;
    git.user.name = "rescanix";
    gpg.enable = true;
    irssi.enable = true;
  };

  home.packages = with pkgs; [
    amdgpu_top
    binwalk
    brave
    cpu-x
    ddrescue
    disko
    dmidecode
    drm_info
    duperemove
    efibootmgr
    efivar
    exiftool
    ffmpeg_6-full
    fio
    geekbench
    ghidra
    gimp
    gparted
    gptfdisk
    hashcat
    hyperfine
    hyprpicker
    imagemagick
    inputs'.overmask.packages.default
    inputs'.paralload.packages.default
    intel-gpu-tools
    iperf
    kdenlive
    kdiskmark
    libva-utils
    linuxPackages_latest.perf
    lm_sensors
    lshw
    mangohud
    mesa-demos
    multipath-tools
    nvme-cli
    nvtopPackages.full
    ookla-speedtest
    osu-lazer-bin
    passgen
    patchelf
    pavucontrol
    pciutils
    powertop
    qbittorrent
    qrencode
    radeontop
    rowhammer-test
    savehw
    sdparm
    smartmontools
    sqlite
    squashfsTools
    sshfs
    steam-run
    superTuxKart
    tbw
    testdisk
    timg
    unigine-heaven
    usbutils
    util-linux
    virt-manager
    vulkan-tools
    wev
    wine
    winetricks
    wireshark
    wl-screenrec
    yt-dlp
    zbar
  ];
}
