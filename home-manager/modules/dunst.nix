{ custom, pkgs }:

{
    services.dunst = {
        enable = true;
        iconTheme = custom.gtkIconTheme;
        settings = {
            global = {
                origin = "bottom-right";
                offset = "10x10";
                follow = "mouse";
                notification_limit = 8;
                font = "${custom.font} 9";
                corner_radius = 10;
                icon_corner_radius = 5;
                mouse_left_click = "close_current";
                mouse_middle_click = "do_action, close_current";
                mouse_right_click = "close_all";
            };
            urgency_low = {
                background = "#${custom.dark1}";
                foreground = "#${custom.light3}";
                frame_color = "#${custom.dark4}";
                timeout = 5;
            };
            urgency_normal = {
                background = "#${custom.dark1}";
                foreground = "#${custom.light3}";
                frame_color = "#${custom.nord2}";
                timeout = 10;
            };
            urgency_critical = {
                background = "#${custom.dark1}";
                foreground = "#${custom.light3}";
                frame_color = "#${custom.red}";
                timeout = 0;
            };
        };
    };
}
