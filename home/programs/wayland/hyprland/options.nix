{config, ...}: {
  wayland.windowManager.hyprland.settings = {
    monitor =
      map (
        defined: let
          resolution =
            if defined.width == 0 || defined.height == 0
            then "preferred"
            else "${builtins.toString defined.width}${builtins.toString defined.height}@${
              builtins.toString (
                if defined.refreshRate == 0
                then 60
                else defined.refreshRate
              )
            }";
          position = "${builtins.toString defined.x}x${builtins.toString defined.y}";
        in "${defined.name},${
          if defined.enabled
          then "${resolution},${position},${builtins.toString defined.scale}"
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
