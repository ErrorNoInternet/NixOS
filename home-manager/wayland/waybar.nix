{
  config,
  custom,
  inputs,
  lib,
  pkgs,
  ...
}: {
  programs.waybar = {
    enable = true;
    settings.mainBar = {
      position = "top";
      layer = "top";
      height = 34;
      margin-top = 0;
      margin-bottom = 0;
      margin-left = 0;
      margin-right = 0;
      modules-left = [
        "custom/launcher"
        "cpu"
        "memory"
        "network#usage"
      ];
      modules-center = [
        "hyprland/workspaces"
      ];
      modules-right = [
        "tray"
        "pulseaudio"
        "network#status"
        "battery"
        "clock"
      ];
      clock = {
        format = "  {:%a, %b %d, %H:%M}";
        tooltip = "true";
        tooltip-format = "<tt><small>{calendar}</small></tt>";
        format-alt = "  {:%m/%d}";
      };
      "wlr/workspaces" = {
        active-only = false;
        all-outputs = false;
        on-click = "activate";
        disable-scroll = false;
        on-scroll-up = "hyprctl dispatch workspace e-1";
        on-scroll-down = "hyprctl dispatch workspace e+1";
        format = "{name}";
        format-icons = {
          urgent = "";
          active = "";
          default = "";
          sort-by-number = true;
        };
      };
      battery = {
        states = {
          good = 95;
          warning = 35;
          critical = 15;
        };
        format = "{icon}  {capacity}%";
        format-charging = "  {capacity}%";
        format-plugged = "  {capacity}%";
        tooltip-format = "{time}";
        format-icons = ["" "" "" "" ""];
      };
      cpu = {
        format = "󰻠 {usage}%";
        format-alt = "󰻠 {avg_frequency} GHz";
        interval = 5;
      };
      memory = {
        format = "󰍛 {}%";
        format-alt = "󰍛 {used}/{total} GiB";
        tooltip-format = "swap: {swapUsed}/{swapTotal} GiB";
        interval = 5;
      };
      "network#usage" = {
        format = "󱚻  {bandwidthTotalBytes}";
        format-alt = "󱚻  {bandwidthUpBytes}  {bandwidthDownBytes} ";
        tooltip-format = "{bandwidthUpBits}  {bandwidthDownBits} ";
        format-disconnected = "󱚻  ?";
        interval = 1;
      };
      "network#status" = {
        format-wifi = "  {signalStrength}%";
        format-ethernet = "󰈀  {ifname} (eth)";
        tooltip-format-wifi = "({frequency} GHz) Connected to {essid} ({gwaddr}) via {ifname} ({ipaddr})";
        tooltip-format-ethernet = "Connected via {ifname} ({gwaddr} -> {ipaddr})";
        format-linked = "󰈀  {ifname} (eth) (No IP)";
        format-disconnected = "󰖪  ?";
      };
      pulseaudio = {
        format = "{icon} {volume}%";
        format-icons = {
          default = ["󰕿" "󰖀" "󰕾"];
        };
        format-muted = "󰝟";
        scroll-step = 5;
        on-click = "${pkgs.pavucontrol}/bin/pavucontrol";
      };
      tray = {
        icon-size = 20;
        spacing = 8;
      };
      "custom/launcher" = {
        format = "";
        on-click = "${pkgs.rofi}/bin/rofi -show drun";
        tooltip = false;
      };
    };
    style = ''
      * {
        border: none;
        border-radius: 0px;
        font-family: ${custom.font};
        font-size: 12px;
        min-height: 0;
      }

      window#waybar {
        background-color: rgba(${builtins.toString (lib.intersperse ", " (inputs.nix-colors.lib.conversions.hexToRGB config.colorScheme.colors.base02))}, ${custom.barOpacity});
      }

      #workspaces {
        background-color: #${config.colorScheme.colors.base00};
        color: #${config.colorScheme.colors.base02};
        margin: 4px 4px;
        padding: 4px 2px;
        border-radius: 16px;
      }

      #workspaces button {
        background-color: #${config.colorScheme.colors.base01};
        color: #${config.colorScheme.colors.base04};
        padding: 0px 10px;
        margin: 0px 4px;
        border-radius: 16px;
        min-width: 20px;
        transition: all 0.2s ease-in-out;
      }

      #workspaces button.active {
        background-color: #${config.colorScheme.colors.base0D};
        color: #${config.colorScheme.colors.base02};
        border-radius: 16px;
        min-width: 40px;
        background-size: 400% 400%;
        transition: all 0.2s ease-in-out;
      }

      #workspaces button:hover {
        background-color: #${config.colorScheme.colors.base04};
        color: #${config.colorScheme.colors.base02};
        border-radius: 16px;
        min-width: 40px;
        background-size: 400% 400%;
      }

      #cpu, #memory, #tray, #pulseaudio, #network, #battery {
        background-color: #${config.colorScheme.colors.base00};
        color: #${config.colorScheme.colors.base04};
        margin: 4px 0px;
        margin-left: 7px;
        border-radius: 16px 16px 16px 16px;
        padding: 0px 20px;
        font-weight: bold;
      }

      #clock {
        background-color: #${config.colorScheme.colors.base00};
        color: #${config.colorScheme.colors.base04};
        border-radius: 20px 0px 0px 20px;
        padding: 2px 15px 2px 20px;
        margin-left: 7px;
        font-weight: bold;
      }

      #custom-launcher {
        background-color: #${config.colorScheme.colors.base00};
        color: #${config.colorScheme.colors.base0D};
        border-radius: 0px 20px 20px 0px;
        padding: 0px 30px 0px 15px;
        margin: 0px;
        font-size: 22px;
      }
    '';
  };
}
