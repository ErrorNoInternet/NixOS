{
  inputs',
  pkgs,
  self',
  ...
}: {
  caches.nix-gaming.enable = true;

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
    username = "error";
    homeDirectory = "/home/error";
    packages = with pkgs; [
      # desktop
      hyprpicker
      self'.packages.scratchpad

      # system utilities
      _7zz
      bandwhich
      compsize
      duf
      ffmpeg_6-full
      nmap
      nvtop
      procs
      pv
      self'.packages.tbw
      timg

      # graphical utilities
      firefox
      gimp
      imhex
      qbittorrent

      # development utilities
      jetbrains.idea-community

      # games
      inputs'.nix-gaming.packages.osu-lazer-bin
      inputs'.nix-gaming.packages.wine-ge
      prismlauncher
      superTuxKart
    ];
  };
}
