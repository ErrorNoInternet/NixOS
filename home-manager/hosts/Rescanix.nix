{
  inputs,
  lib,
  pkgs,
  self,
  ...
}: let
  custom = {
    hostname = "Rescanix";
    font = "JetBrainsMono Nerd Font";
    predefinedColorScheme = "Nord";
    opacity = "0.8";
    subtleOpacity = "0.9";
    barOpacity = "0.7";
    menuOpacity = "0.3";
    terminal = "foot";
    browser = "firefox";
    pointerCursor = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
      size = 16;
    };
    gtkTheme = {
      name = "Colloid-Dark-${custom.predefinedColorScheme}";
      package = pkgs.colloid-gtk-theme.override {tweaks = ["${lib.strings.toLower custom.predefinedColorScheme}"];};
    };
    gtkIconTheme = {
      name = "Colloid-${lib.strings.toLower custom.predefinedColorScheme}-dark";
      package = pkgs.colloid-icon-theme.override {schemeVariants = ["nord"];};
    };
  };
in {
  _module.args = {inherit custom;};
  imports = [
    ../../shared/caches
    ../common.nix
    ../locations/china.nix
    ../modules/cursor.nix
    ../modules/gtk.nix
    ../modules/mimeapps.nix
    ../profiles/development
    ../profiles/wm.nix
    ../programs/fcitx.nix
    ../programs/imv.nix
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
    inputs.nixvim.homeManagerModules.nixvim
  ];

  colorScheme = inputs.nix-colors.colorSchemes.nord;
  home = {
    username = "ryan";
    homeDirectory = "/home/ryan";
    file = {
      "pictures/wallpapers".source = ../../other/wallpapers;
    };
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
    ];
    sessionVariables = {
      TERMINAL = "${custom.terminal}";
      BROWSER = "${custom.browser}";
    };
  };
}
