{config, ...}: {
  wayland.windowManager.hyprland = {
    settings = with config.colors.scheme.palette; {
      general = {
        gaps_in = 6;
        gaps_out = 10;
        border_size = 2;
        "col.active_border" = "rgb(${base0D})";
        "col.inactive_border" = "rgb(${base03})";
        layout = "dwindle";
      };

      group = {
        "col.border_active" = "rgb(${base0D})";
        "col.border_inactive" = "rgb(${base03})";
        "col.border_locked_active" = "rgb(${base0F})";
        "col.border_locked_inactive" = "rgb(${base03})";
        groupbar = {
          gradients = false;
          render_titles = false;

          "col.active" = "rgb(${base0D})";
          "col.inactive" = "rgb(${base03})";
          "col.locked_active" = "rgb(${base0F})";
          "col.locked_inactive" = "rgb(${base03})";
        };
      };

      decoration = {
        drop_shadow = true;

        rounding = 14;
        shadow_range = 25;
        shadow_render_power = 3;
        "col.shadow" = "rgb(${base00})";

        blur = {
          enabled = true;

          popups = true;
          popups_ignorealpha = 0.5;

          passes = 3;
          size = 8;
        };
      };

      misc = {
        animate_manual_resizes = true;
        animate_mouse_windowdragging = true;
      };

      animations = {
        enabled = true;

        bezier = "extremeEaseOut, 0, 1, 0, 1";
        animation = [
          "fade,       1, 5, default"
          "layers,     1, 1, default,        popin 90%"
          "windows,    1, 5, extremeEaseOut, popin 75%"
          "windowsOut, 1, 5, default,        popin 75%"
          "workspaces, 1, 4, extremeEaseOut"
        ];
      };
    };

    extraConfig = ''
      layerrule=animation fade,      hyprpicker
      layerrule=animation fade,      wleave
      layerrule=animation slide top, swaync-control-center
      layerrule=blur,                rofi
      layerrule=blur,                swaync-notification-window
      layerrule=blur,                waybar
      layerrule=blur,                wleave
      layerrule=ignorezero,          rofi
      layerrule=ignorezero,          swaync-notification-window
    '';
  };
}
