{config, ...}: {
  wayland.windowManager.hyprland = {
    settings = with config.colorScheme.colors; {
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

        rounding = 10;
        shadow_range = 25;
        shadow_render_power = 2;
        "col.shadow" = "rgb(${base00})";

        blur = {
          enabled = true;
          popups = true;

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

        bezier = "customBezier, 0.05, 0.9, 0.1, 1.00";
        animation = [
          "windows, 1, 5, customBezier"
          "windowsOut, 1, 5, default, popin 80%"
          "border, 1, 5, default"
          "borderangle, 1, 5, default"
          "fade, 1, 5, default"
          "workspaces, 1, 5, customBezier"
        ];
      };
    };

    extraConfig = ''
      layerrule=blur,gtk-layer-shell
      layerrule=blur,rofi
      layerrule=blur,waybar
      layerrule=ignorezero,rofi
    '';
  };
}
