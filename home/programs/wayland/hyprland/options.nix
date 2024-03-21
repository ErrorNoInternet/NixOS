{config, ...}: {
  wayland.windowManager.hyprland.settings = {
    monitor =
      map (
        monitor: let
          resolution =
            if monitor.width == 0 || monitor.height == 0
            then "preferred"
            else "${builtins.toString monitor.width}x${builtins.toString monitor.height}@${
              builtins.toString (
                if monitor.refreshRate == 0
                then 60
                else monitor.refreshRate
              )
            }";
          position = "${builtins.toString monitor.x}x${builtins.toString monitor.y}";
        in "${monitor.name},${
          if monitor.enabled
          then "${resolution},${position},${builtins.toString monitor.scale}"
          else "disable"
        }"
      )
      config.desktop.monitors;

    misc = {
      disable_hyprland_logo = true;
      disable_splash_rendering = true;
      key_press_enables_dpms = true;
      mouse_move_enables_dpms = true;
    };

    dwindle.preserve_split = true;
  };
}
