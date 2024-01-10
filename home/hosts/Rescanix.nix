{
  inputs,
  pkgs,
  self,
  ...
}: {
  caches.nix-gaming.enable = true;

  colors = {
    schemeName = "Nord";
    scheme = inputs.nix-colors.colorSchemes.nord;
  };

  profiles = {
    windowManager.enable = true;
    desktop = {
      enable = true;
      enableNvidia = true;
    };
  };

  desktop = {
    hyprland.enable = true;
    monitors = [{}];
  };

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
    username = "ryan";
    homeDirectory = "/home/ryan";
    packages = with pkgs; [
      (hashcat.override {cudaSupport = true;})
      _7zz
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
      ffmpeg_6-full
      fio
      firefox
      geekbench
      gimp
      gparted
      gptfdisk
      hyperfine
      hyprpicker
      imagemagick
      inputs.hyprwm-contrib.packages.${pkgs.system}.scratchpad
      inputs.nix-gaming.packages.${pkgs.system}.wine-ge
      intel-gpu-tools
      kdiskmark
      linuxPackages_latest.perf
      lm_sensors
      lshw
      mangohud
      mesa-demos
      multipath-tools
      nmap
      nvtop
      osu-lazer-bin
      parted
      patchelf
      pavucontrol
      pciutils
      powertop
      prismlauncher
      procs
      pv
      python3Packages.bpython
      qrencode
      radeontop
      sdparm
      self.packages.${pkgs.system}.passgen
      self.packages.${pkgs.system}.savehw
      self.packages.${pkgs.system}.tbw
      smartmontools
      sqlite
      sshfs
      steam-run
      superTuxKart
      sysstat
      timg
      unigine-heaven
      usbutils
      util-linux
      virt-manager
      vulkan-tools
      zbar
    ];
  };
}
