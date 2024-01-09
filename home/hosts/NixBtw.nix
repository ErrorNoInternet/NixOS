{
  inputs,
  pkgs,
  self,
  ...
}: let
  custom = {
    hostname = "NixBtw";
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
