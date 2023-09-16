{ custom, pkgs, ... }:

{
    programs.waybar = {
        enable = true;
        systemd = {
            enable = true;
            target = "hyprland-session.target";
        };
        settings.mainBar = {
            position = "top";
            layer = "top";
            height = 35;
            margin-top = 0;
            margin-bottom = 0;
            margin-left = 0;
            margin-right = 0;
            modules-left = [
                "custom/launcher"
                "cpu"
                "memory"
            ];
            modules-center = [
                "hyprland/workspaces"
            ];
            modules-right = [
                "tray"
                "pulseaudio"
                "network"
                "battery"
                "clock"
            ];
            clock = {
                format = " {:%a, %b %d, %H:%M}";
                tooltip = "true";
                tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
                format-alt = " {:%m/%d}";
            };
            "wlr/workspaces"= {
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
                    default  = "";
                    sort-by-number = true;
                };
            };
            battery = {
                states = {
                    good = 95;
                    warning = 30;
                    critical = 15;
                };
                format = "{icon}  {capacity}%";
                format-charging = "  {capacity}%";
                format-plugged = "  {capacity}%";
                format-alt = "{icon}  {time}";
                format-icons = ["" "" "" "" ""];
            };
            memory = {
                format = "󰍛 {}%";
                format-alt = "󰍛 {used}/{total} GiB";
                interval = 5;
            };
            cpu = {
                format = "󰻠 {usage}%";
                format-alt = "󰻠 {avg_frequency} GHz";
                interval = 5;
            };
            network = {
                format-wifi = "  {signalStrength}%";
                format-ethernet = "󰈀 (eth)";
                tooltip-format = "Connected to {essid} ({gwaddr}) via {ifname}";
                format-linked = "{ifname} (No IP)";
                format-disconnected = "󰖪 ?";
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
            "custom/launcher"= {
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
                background-color: #${custom.dark3};
            }

            #workspaces {
                background-color: #${custom.dark1};
                color: #${custom.dark3};
                margin: 4px 4px;
                padding: 4px 2px;
                border-radius: 16px;
            }

            #workspaces button {
                background-color: #${custom.dark2};
                color: #${custom.light1};
                padding: 0px 10px;
                margin: 0px 4px;
                border-radius: 16px;
                min-width: 20px;
                transition: all 0.3s ease-in-out;
            }

            #workspaces button.active {
                background-color: #${custom.nord3};
                color: #${custom.dark3};
                border-radius: 16px;
                min-width: 40px;
                background-size: 400% 400%;
                transition: all 0.2s ease-in-out;
            }

            #workspaces button:hover {
                background-color: #${custom.light1};
                color: #${custom.dark3};
                border-radius: 16px;
                min-width: 40px;
                background-size: 400% 400%;
            }

            #cpu, #memory, #tray, #pulseaudio, #network, #battery {
                background-color: #${custom.dark1};
                color: #${custom.light1};
                margin: 4px 0px;
                margin-left: 7px;
                border-radius: 16px 16px 16px 16px;
                padding: 0px 20px;
                font-weight: bold;
            }

            #clock {
                background-color: #${custom.dark1};
                color: #${custom.light1};
                border-radius: 0px 0px 0px 20px;
                padding: 2px 15px 2px 20px;
                margin-left: 7px;
                font-weight: bold;
            }

            #custom-launcher {
                background-color: #${custom.dark1};
                color: #${custom.nord3};
                border-radius: 0px 0px 20px 0px;
                padding: 0px 30px 0px 15px;
                margin: 0px;
                font-size: 22px;
            }
        '';
    };
}
