{
  inputs',
  pkgs,
  self',
  ...
}: {
  caches.nix-gaming.enable = true;

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
      nheko.enable = true;
      obsStudio.enable = true;
      spotify.enable = true;
      thunderbird.enable = true;
      virtManager.enable = true;
    };

    terminal = {
      cava.enable = true;
      git.enable = true;
      gpg.enable = true;
      irssi.enable = true;
    };
  };

  home = {
    username = "error";
    homeDirectory = "/home/error";
    packages = with pkgs; [
      (hashcat.override {cudaSupport = true;})
      _7zz
      amdgpu_top
      bandwhich
      blender
      brave
      compsize
      cpu-x
      ddrescue
      dmidecode
      drm_info
      duf
      duperemove
      efibootmgr
      efivar
      ethtool
      ffmpeg_6-full
      fio
      firefox
      geekbench
      ghidra
      gimp
      gparted
      gptfdisk
      hyperfine
      hyprpicker
      imagemagick
      inputs'.nix-gaming.packages.osu-lazer-bin
      inputs'.nix-gaming.packages.wine-ge
      inputs'.overmask.packages.overmask
      inputs'.paralload.packages.paralload
      intel-gpu-tools
      iperf
      kdenlive
      kdiskmark
      linuxPackages_latest.perf
      lm_sensors
      lshw
      mangohud
      mesa-demos
      multipath-tools
      nmap
      nvme-cli
      nvtop
      ookla-speedtest
      parted
      patchelf
      pavucontrol
      pciutils
      powertop
      prismlauncher
      procs
      pv
      qrencode
      radeontop
      sdparm
      self'.packages.passgen
      self'.packages.savehw
      self'.packages.scratchpad
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
      wl-screenrec
      zbar
    ];
  };
}
