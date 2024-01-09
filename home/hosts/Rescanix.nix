{
  inputs,
  pkgs,
  self,
  ...
}: let
  custom = {
    hostname = "Rescanix";
    opacity = "0.8";
    subtleOpacity = "0.9";
    barOpacity = "0.7";
    menuOpacity = "0.3";
    terminal = "foot";
    browser = "firefox";
  };
in {
  _module.args = {inherit custom;};
  imports = [
    ../common.nix
    ../locations/china.nix
    ../profiles/development
    ../profiles/wm.nix
    ../programs/fcitx.nix
    ../programs/kdeconnect.nix
    ../programs/mpv.nix
    ../programs/obs-studio.nix
    ../programs/spicetify.nix
    ../programs/virt-manager.nix
    ../terminal/btop.nix
    ../terminal/cava.nix
    ../terminal/foot.nix
    ../terminal/git.nix
    ../wayland/hyprland-autoname-workspaces.nix
    ../wayland/hyprland.nix
    inputs.agenix.homeManagerModules.default
  ];

  caches = {
    ErrorNoBinaries.enable = true;
    hyprland.enable = true;
    nix-community.enable = true;
    nix-gaming.enable = true;
  };

  colors = {
    schemeName = "Nord";
    scheme = inputs.nix-colors.colorSchemes.nord;
  };

  gtkCustomization.enable = true;

  mimeapps.image.enable = true;

  nvidia.desktopEntries.enable = true;

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
    sessionVariables = {
      TERMINAL = "${custom.terminal}";
      BROWSER = "${custom.browser}";
    };
  };
}
