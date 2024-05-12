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

  desktop.monitors = [{} {} {}];

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
    apt
    aria2
    arp-scan
    binsort
    binwalk
    btrfs-heatmap
    chromium
    clamtk
    cmake
    cowsay
    cpu-x
    ddrescue
    dmidecode
    dnf5
    dpkg
    dracut
    drm_info
    duperemove
    efibootmgr
    efivar
    exiftool
    ffmpeg_6-full
    figlet
    fio
    geekbench
    ghidra
    gimp
    gobuster
    gocryptfs
    gparted
    gptfdisk
    hashcat
    hyperfine
    hyprpicker
    imagemagick
    inputs'.disko.packages.default
    inputs'.overmask.packages.default
    inputs'.paralload.packages.default
    intel-gpu-tools
    iperf
    john
    kdenlive
    kdiskmark
    kexec-tools
    libeatmydata
    libva-utils
    linuxPackages_latest.perf
    lm_sensors
    lolcat
    lshw
    mangohud
    mesa-demos
    meson
    metasploit
    multipath-tools
    nvme-cli
    nvtopPackages.full
    ookla-speedtest
    osu-lazer-bin
    pacman
    par2cmdline-turbo
    passgen
    patchelf
    pavucontrol
    pciutils
    powertop
    qbittorrent
    qrencode
    radeontop
    rowhammer-test
    rpm
    rustscan
    sambaFull
    savehw
    sdparm
    sl
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
    upx
    usbutils
    util-linux
    uutils-coreutils
    virt-manager
    vlc
    vscodium
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
