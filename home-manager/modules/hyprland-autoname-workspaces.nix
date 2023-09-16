{ custom, ... }:

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
            DEFAULT = " "
            "Brave-browser" = " "
            "discord" = "󰙯 "
            "firefox" = " "
            "Gimp-2.10" = " "
            "kitty" = ""
            "Minecraft.*" = "󰍳 "
            "mpv" = " "
            "Mullvad VPN" = "󰖂 "
            "nheko" = " "
            "openrgb" = " "
            "org.prismlauncher.PrismLauncher" = "󰍳 "
            "org.qbittorrent.qBittorrent" = "󰰛 "
            "osu!" = " "
            "pavucontrol" = " "
            "Rofi" = " "
            "Spotify" = " "
            "steam" = " "
            "virt-manager" = " "
            "zoom" = "󰬡 "

            [exclude]
            "" = "^$"
        '';
    };
}
