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
    ../programs/gnupg.nix
    ../programs/gtk.nix
    ../programs/imv.nix
    ../programs/irssi.nix
    ../programs/joshuto.nix
    ../programs/kdeconnect.nix
    ../programs/kitty.nix
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
      hyprland-autoname-workspaces
      hyprpicker
      inputs.hyprwm-contrib.packages.${pkgs.system}.scratchpad

      # system utilities
      self.packages.${pkgs.system}.tbw
      _7zz
      bandwhich
      compsize
      croc
      dua
      duf
      fd
      ffmpeg_6-full
      inputs.hsize.packages.${pkgs.system}.hsize
      jq
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
  };
}
