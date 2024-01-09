{
  inputs,
  pkgs,
  self,
  ...
}: {
  imports = [
    ../common.nix
    ../programs/fcitx.nix
    ../programs/kdeconnect.nix
    ../programs/libreoffice.nix
    ../programs/mpv.nix
    ../programs/nheko.nix
    ../programs/obs-studio.nix
    ../programs/spicetify.nix
    ../programs/terminal/btop.nix
    ../programs/terminal/cava.nix
    ../programs/terminal/foot.nix
    ../programs/terminal/git.nix
    ../programs/terminal/gnupg.nix
    ../programs/terminal/irssi.nix
    ../programs/thunderbird.nix
    ../programs/virt-manager.nix
    ../wayland/hyprland-autoname-workspaces.nix
    ../wayland/hyprland.nix
  ];

  profiles = {
    windowManager.enable = true;
    desktop = {
      enable = true;
      enableNvidia = true;
    };
  };

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

  desktop = {
    modifierKey = "ALT";
    monitors = [
      {
        name = "eDP-1";
        width = 1920;
        height = 1080;
        x = 1680;
      }
      {
        name = "VGA-1";
        width = 1680;
        height = 1050;
      }
      {}
    ];
  };

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
  };
}
