{
  config,
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
    terminalFloating = "foot -a foot-floating";
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
    ../profiles/development
    ../profiles/wm
    ../programs/btop.nix
    ../programs/cava.nix
    ../programs/desktop-entries.nix
    ../programs/fastfetch.nix
    ../programs/fcitx.nix
    ../programs/foot.nix
    ../programs/git.nix
    ../programs/gnupg.nix
    ../programs/gtk.nix
    ../programs/imv.nix
    ../programs/irssi.nix
    ../programs/kdeconnect.nix
    ../programs/libreoffice.nix
    ../programs/mpv.nix
    ../programs/nheko.nix
    ../programs/obs-studio.nix
    ../programs/thunderbird.nix
    ../programs/virt-manager.nix
    ../wayland/hyprland-autoname-workspaces.nix
    ../wayland/hyprland.nix
    ./common.nix
  ];

  colorScheme = inputs.nix-colors.colorSchemes.nord;
  home = {
    username = "ryan";
    homeDirectory = "/home/ryan";
    file = {
      downloads.source = config.lib.file.mkOutOfStoreSymlink "/mnt/data/downloads";
      data.source = config.lib.file.mkOutOfStoreSymlink "/mnt/data";
      "pictures/wallpapers".source = ../../other/wallpapers;
    };
    packages = with pkgs; [
      # desktop
      hyprpicker
      inputs.hyprwm-contrib.packages.${pkgs.system}.scratchpad

      # system utilities
      self.packages.${pkgs.system}.tbw
      _7zz
      bandwhich
      compsize
      duf
      ffmpeg_6-full
      nmap
      nvtop
      procs
      pv
      timg

      # graphical utilities
      brave
      firefox
      gimp
      imhex
      qbittorrent
      (discord-canary.override {
        withOpenASAR = true;
        withVencord = true;
      })

      # development utilities
      jetbrains.idea-community

      # games
      prismlauncher
      superTuxKart
      inputs.nix-gaming.packages.${pkgs.system}.osu-lazer-bin
      inputs.nix-gaming.packages.${pkgs.system}.wine-ge

      # ABSOLUTELY PROPRIETARY
      zoom-us
    ];
    sessionVariables = {
      TERMINAL = "${custom.terminal}";
      BROWSER = "${custom.browser}";
    };
  };
}
