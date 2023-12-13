{
  inputs,
  lib,
  pkgs,
  self,
  ...
}: let
  custom = {
    font = "JetBrainsMono Nerd Font";
    predefinedColorScheme = "Nord";
    opacity = ".8";
    subtleOpacity = ".9";
    barOpacity = ".7";
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
    ../modules/cursor.nix
    ../modules/gtk.nix
    ../modules/mimeapps.nix
    ../profiles/development
    ../profiles/wm
    ../programs/btop.nix
    ../programs/cava.nix
    ../programs/fcitx.nix
    ../programs/foot.nix
    ../programs/git.nix
    ../programs/imv.nix
    ../programs/kdeconnect.nix
    ../programs/mpv.nix
    ../programs/obs-studio.nix
    ../programs/virt-manager.nix
    ../wayland/hyprland-autoname-workspaces.nix
    ../wayland/hyprland.nix
    ./common.nix
  ];

  colorScheme = inputs.nix-colors.colorSchemes.nord;
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
      gptfdisk
      hyperfine
      hyprpicker
      imagemagick
      inputs.hyprwm-contrib.packages.${pkgs.system}.scratchpad
      inputs.nix-gaming.packages.${pkgs.system}.osu-lazer-bin
      inputs.nix-gaming.packages.${pkgs.system}.wine-ge
      intel-gpu-tools
      kdiskmark
      linuxPackages_latest.perf
      lm_sensors
      lshw
      lsof
      mangohud
      mesa-demos
      multipath-tools
      nmap
      nvtop
      patchelf
      pavucontrol
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
      virt-manager
      vulkan-tools
    ];
    sessionVariables = {
      TERMINAL = "${custom.terminal}";
      BROWSER = "${custom.browser}";
    };
  };
}
