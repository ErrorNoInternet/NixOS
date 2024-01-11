{
  inputs,
  pkgs,
  self,
  ...
}: {
  caches.nix-gaming.enable = true;

  colors = {
    schemeName = "Nord";
    scheme = inputs.nix-colors.colorSchemes.nord;
  };

  profiles = {
    windowManager.enable = true;
    desktop = {
      enable = true;
      enableNvidia = true;
    };
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

  home.programs = {
    graphical = {
      discord.enable = true;
      kdeconnect.enable = true;
      libreoffice.enable = true;
      nheko.enable = true;
      obsStudio.enable = true;
      spotify.enable = true;
      thunderbird.enable = true;
      virtManager.enable = true;
    };

    terminal = {
      cava.enable = true;
      git.enable = true;
      gpg.enable = true;
      irssi.enable = true;
    };
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
