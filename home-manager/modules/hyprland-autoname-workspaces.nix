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
            "firefox" = " "
            "kitty" = ""
            "discord" = "󰙯 "
            "nheko" = " "
            "Gimp-2.10" = " "
            "mpv" = " "
            "pavucontrol" = " "
            "Spotify" = " "
            "steam" = " "
            "Rofi" = " "
            "org.prismlauncher.PrismLauncher" = "󰍳 "
            "Minecraft.*" = "󰍳 "
            "Mullvad VPN" = "󰖂 "
            "openrgb" = ""
            "virt-manager" = " "
            "Brave-browser" = " "
            "zoom" = "󰬡 "

            [exclude]
            "" = "^$"
        '';
    };
}
