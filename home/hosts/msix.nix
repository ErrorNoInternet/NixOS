{pkgs, ...}: {
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
      }
      {
        name = "VGA-1";
        width = 1680;
        height = 1050;
        x = -1680;
      }
      {}
    ];
  };

  customPrograms = {
    discord.enable = true;
    kdeconnect.enable = true;
    libreoffice.enable = true;
    prismlauncher.enable = true;
    spotify.enable = true;
    thunderbird.enable = true;
    virtManager.enable = true;
    cava.enable = true;
    git = {
      user = {
        name = "ErrorNoInternet";
        email = "errornointernet@envs.net";
      };
      signing = {
        key = "2486BFB7B1E6A4A3";
        signByDefault = true;
      };
    };
    gpg = {
      enable = true;
      defaultKey = "2486BFB7B1E6A4A3";
    };
    iamb.enable = true;
    irssi.enable = true;
    nb = {
      enable = true;
      dataDirectory = "/mnt/data/other/nb";
    };
  };

  programs.fish.interactiveShellInit = ''
    function md
      read -P "[luks] password for btank: " -s LUKS_PASSWORD
      echo "$LUKS_PASSWORD" | sudo cryptsetup luksOpen /dev/disk/by-uuid/5e05e286-205a-4063-9fa1-ac384bed4e9c luks_btank-data0
      and echo "$LUKS_PASSWORD" | sudo cryptsetup luksOpen /dev/disk/by-uuid/136e9203-0172-464e-a795-9f5ed11c96fa luks_btank-cache0
      set -e LUKS_PASSWORD

      echo 5000 | sudo tee /sys/fs/bcache/*/congested_read_threshold_us > /dev/null

      sudo mount /mnt/data
    end
  '';

  home.packages = with pkgs; [
    exiftool
    ffmpeg_6-full
    fio
    gimp
    hyprpicker
    imhex
    jetbrains.idea-community
    nvtopPackages.full
    osu-lazer-bin
    qbittorrent
    superTuxKart
    tbw
    timg
  ];
}
