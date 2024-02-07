{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.home.desktops.hyprland.enable {
    home = {
      packages = [pkgs.hyprland-autoname-workspaces];
      file = {
        "${config.xdg.configHome}/hyprland-autoname-workspaces/config.toml".text = ''
          version = "1.1.11"

          [class]
          ".supertuxkart-wrapped" = "󰵹"
          "Minecraft.*" = "󰍳 "
          "Mullvad VPN" = "󰖂 "
          "libreoffice*" = "󰈙 "
          "org.kde.kdenlive" = "󰸬 "
          "org.prismlauncher.PrismLauncher" = "󰍳 "
          "org.qbittorrent.qBittorrent" = "󰰛 "
          "org.wezfurlong.wezterm" = ""
          "osu!" = "  "
          Brave-browser = " "
          DEFAULT = " "
          Gimp = "󱇣 "
          ImHex = "󱊧"
          Rofi = " "
          Spotify = " "
          discord = "󰙯 "
          firefox = " "
          foot = ""
          jetbrains-idea-ce = ""
          kitty = ""
          mpv = " "
          nheko = " "
          openrgb = " "
          pavucontrol = " "
          steam = " "
          thunderbird = "󰇮 "
          vimiv = " "
          virt-manager = " "
          wezterm = ""
          xdg-desktop-portal-gtk = "󱈄"
          zoom = "󰬡 "

          [class_active]
          DEFAULT = " "

          [initial_class]

          [initial_class_active]

          [workspaces_name]

          [title_in_class]

          [title_in_class_active]

          [title_in_initial_class]

          [title_in_initial_class_active]

          [initial_title_in_class]

          [initial_title_in_class_active]

          [initial_title_in_initial_class]

          [initial_title_in_initial_class_active]

          [exclude]
          "" = "^$"

          [format]
          dedup = true
          dedup_inactive_fullscreen = false
          delim = " "
          workspace = "{id}:{delim}{clients}"
          workspace_empty = "{id}"
          client = "{icon}"
          client_fullscreen = "[{icon}]"
          client_active = "{icon}"
          client_dup = "{icon}{counter_sup}"
          client_dup_active = "*{icon}*{delim}{icon}{counter_unfocused_sup}"
          client_dup_fullscreen = "[{icon}]{delim}{icon}{counter_unfocused_sup}"
        '';
      };
    };
  };
}
