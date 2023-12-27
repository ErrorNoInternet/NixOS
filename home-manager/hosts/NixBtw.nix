{
  inputs,
  lib,
  pkgs,
  self,
  ...
}: let
  custom = {
    hostname = "NixBtw";
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
    ../../shared/caches/all.nix
    ../common.nix
    ../locations/china.nix
    ../modules/cursor.nix
    ../modules/gtk.nix
    ../modules/mimeapps.nix
    ../modules/nvidia-desktop-entries.nix
    ../profiles/development
    ../profiles/wm
    ../programs/fcitx.nix
    ../programs/imv.nix
    ../programs/kdeconnect.nix
    ../programs/libreoffice.nix
    ../programs/mpv.nix
    ../programs/nheko.nix
    ../programs/obs-studio.nix
    ../programs/spicetify.nix
    ../programs/thunderbird.nix
    ../programs/virt-manager.nix
    ../terminal/btop.nix
    ../terminal/cava.nix
    ../terminal/foot.nix
    ../terminal/git.nix
    ../terminal/gnupg.nix
    ../terminal/irssi.nix
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
      inputs.nix-gaming.packages.${pkgs.system}.wine-ge
      osu-lazer-bin
      prismlauncher
      superTuxKart
    ];
    sessionVariables = {
      TERMINAL = "${custom.terminal}";
      BROWSER = "${custom.browser}";
    };
  };
}
