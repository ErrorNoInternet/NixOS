{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: let
  custom = {
    font = "JetBrainsMono Nerd Font";
    opacity = ".8";
    subtleOpacity = ".9";
    barOpacity = ".7";
    predefinedColorScheme = "Nord";
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
    ../profiles/development
    ../profiles/wm
    ../programs/btop.nix
    ../programs/cava.nix
    ../programs/desktop-entries.nix
    ../programs/fastfetch.nix
    ../programs/fcitx.nix
    ../programs/git.nix
    ../programs/gtk.nix
    ../programs/imv.nix
    ../programs/kdeconnect.nix
    ../programs/kitty.nix
    ../programs/mpv.nix
    ../programs/obs-studio.nix
    ../programs/virt-manager.nix
    ../wayland/hyprland-autoname-workspaces.nix
    ../wayland/hyprland.nix
    ./common.nix
  ];

  colorScheme = inputs.nix-colors.colorSchemes.nord;
  home.username = "ryan";
  home.homeDirectory = "/home/ryan";

  home.packages = with pkgs; [
    (hashcat.override {cudaSupport = true;})
    _7zz
    bandwhich
    blender
    brave
    compsize
    config.packages.passgen
    config.packages.savehw
    config.packages.tbw
    cpu-x
    croc
    ddrescue
    drm_info
    dua
    duf
    duperemove
    ffmpeg_6-full
    fio
    firefox
    geekbench
    gimp
    gptfdisk
    hyperfine
    hyprland-autoname-workspaces
    hyprpicker
    inputs.hsize.packages.${pkgs.system}.hsize
    inputs.hyprwm-contrib.packages.${pkgs.system}.grimblast
    inputs.hyprwm-contrib.packages.${pkgs.system}.scratchpad
    inputs.nix-gaming.packages.${pkgs.system}.osu-lazer-bin
    inputs.nix-gaming.packages.${pkgs.system}.wine-ge
    intel-gpu-tools
    jq
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

  home.sessionVariables = {
    TERMINAL = "kitty";
    BROWSER = "firefox";
  };

  home.pointerCursor = {
    name = custom.pointerCursor.name;
    package = custom.pointerCursor.package;
    size = custom.pointerCursor.size;
    x11.enable = true;
    gtk.enable = true;
  };
}
