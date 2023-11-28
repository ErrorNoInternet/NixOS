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
    ../modules/cursor.nix
    ../profiles/development
    ../profiles/wm
    ../programs/btop.nix
    ../programs/cava.nix
    ../programs/desktop-entries.nix
    ../programs/fastfetch.nix
    ../programs/fcitx.nix
    ../programs/foot.nix
    ../programs/git.nix
    ../programs/gtk.nix
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
      config.packages.passgen
      config.packages.savehw
      config.packages.tbw
      cpu-x
      ddrescue
      drm_info
      duf
      duperemove
      ffmpeg_6-full
      fio
      firefox
      geekbench
      gimp
      gptfdisk
      hyperfine
      hyprpicker
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
  };
}
