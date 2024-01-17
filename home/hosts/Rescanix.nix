{
  inputs,
  pkgs,
  self,
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

  home.programs = {
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
      inputs.hyprwm-contrib.packages.${system}.scratchpad
      inputs.nix-gaming.packages.${system}.wine-ge
      inputs.overmask.packages.${system}.overmask
      intel-gpu-tools
      iperf
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
      self.packages.${system}.passgen
      self.packages.${system}.savehw
      self.packages.${system}.tbw
      smartmontools
      sqlite
      sshfs
      steam-run
      superTuxKart
      sysstat
      timg
      tree
      unigine-heaven
      usbutils
      util-linux
      virt-manager
      vulkan-tools
      wl-screenrec
      zbar
    ];
  };
}
