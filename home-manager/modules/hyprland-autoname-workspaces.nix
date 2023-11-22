{
  home.file = {
    ".config/hyprland-autoname-workspaces/config.toml".text = ''
      version = "1.1.7"

      [format]
      dedup = true
      client = "{icon}"
      client_active = "{icon}"

      [class_active]
      DEFAULT = " "

      [class]
      "Brave-browser" = " "
      "discord" = "󰙯 "
      "firefox" = " "
      "Gimp-2.10" = " "
      "ImHex" = "󱊧"
      "jetbrains-idea-ce" = ""
      "kitty" = ""
      "libreoffice*" = "󰈙 "
      "Minecraft.*" = "󰍳 "
      "mpv" = " "
      "Mullvad VPN" = "󰖂 "
      "nheko" = " "
      "openrgb" = " "
      "org.kde.kdenlive" = "󰸬 "
      "org.prismlauncher.PrismLauncher" = "󰍳 "
      "org.qbittorrent.qBittorrent" = "󰰛 "
      "osu!" = " "
      "pavucontrol" = " "
      "Rofi" = " "
      "Spotify" = " "
      "steam" = " "
      "thunderbird" = "󰇮 "
      "virt-manager" = " "
      "xdg-desktop-portal-gtk" = "󱈄"
      "zoom" = "󰬡 "
      DEFAULT = " "

      [exclude]
      "" = "^$"
    '';
  };
}
