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
    ../modules/bat.nix
    ../modules/btop.nix
    ../modules/cava.nix
    ../modules/desktop-entries.nix
    ../modules/dunst.nix
    ../modules/fastfetch.nix
    ../modules/fcitx.nix
    ../modules/fish.nix
    ../modules/git.nix
    ../modules/gtk.nix
    ../modules/hyprland-autoname-workspaces.nix
    ../modules/hyprland.nix
    ../modules/imv.nix
    ../modules/kdeconnect.nix
    ../modules/kitty.nix
    ../modules/mpv.nix
    ../modules/neovim.nix
    ../modules/obs-studio.nix
    ../modules/rofi.nix
    ../modules/tmux.nix
    ../modules/virt-manager.nix
    ../modules/waybar.nix
    ../modules/yazi.nix
    ../modules/zoxide.nix
    ../modules/zsh.nix
    inputs.nix-colors.homeManagerModules.default
  ];

  colorScheme = inputs.nix-colors.colorSchemes.nord;
  home.username = "ryan";
  home.homeDirectory = "/home/ryan";

  home.packages = with pkgs; [
    (hashcat.override {cudaSupport = true;})
    (import ../../workstation/derivations/savehw.nix {inherit pkgs;})
    (import ../../workstation/derivations/passgen.nix {inherit pkgs;})
    (import ../../workstation/derivations/tbw.nix {inherit pkgs;})
    (import ../derivations/brightness.nix {inherit pkgs;})
    (import ../derivations/pavolume.nix {inherit pkgs;})
    (import ../derivations/swaylock.nix {inherit config custom pkgs;})
    _7zz
    bandwhich
    blender
    brave
    cava
    clang
    clang-tools
    cliphist
    cmatrix
    compsize
    cpu-x
    croc
    ddrescue
    drm_info
    dua
    duf
    duperemove
    eza
    fastfetch
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
    python3
    radeontop
    ripdrag
    rustup
    slurp
    smartmontools
    sqlite
    sshfs
    steam-run
    superTuxKart
    swayidle
    swaylock-effects
    swww
    sysstat
    timg
    unigine-heaven
    virt-manager
    vulkan-tools
    wf-recorder
    wl-clipboard
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
