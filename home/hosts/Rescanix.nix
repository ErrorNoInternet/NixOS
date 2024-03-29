{
  inputs',
  pkgs,
  self',
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
    graphical = {
      kdeconnect.enable = true;
      libreoffice.enable = true;
      obsStudio.enable = true;
      spotify.enable = true;
      thunderbird.enable = true;
      virtManager.enable = true;
    };
    terminal = {
      cava.enable = true;
      git.user.name = "Rescanix";
      gpg.enable = true;
      irssi.enable = true;
    };
  };

  home.packages = with pkgs; [
    amdgpu_top
    brave
    compsize
    cpu-x
    ddrescue
    dmidecode
    drm_info
    duperemove
    efibootmgr
    efivar
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
    patchelf
    pavucontrol
    pciutils
    powertop
    prismlauncher
    qbittorrent
    qrencode
    radeontop
    sdparm
    self'.packages.firefox
    self'.packages.passgen
    self'.packages.savehw
    self'.packages.tbw
    smartmontools
    sqlite
    squashfsTools
    sshfs
    steam-run
    superTuxKart
    timg
    tree
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
