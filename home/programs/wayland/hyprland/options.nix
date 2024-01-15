{config, ...}: {
  wayland.windowManager.hyprland.settings = {
    "$mod" = config.desktop.modifierKey;

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

    input = {
      touchpad = {
        natural_scroll = true;
        disable_while_typing = false;
      };
      kb_layout = "us";
      follow_mouse = 1;
      accel_profile = "flat";
      sensitivity = 0.75;
      repeat_delay = 200;
      repeat_rate = 45;
    };

    gestures = {
      workspace_swipe = true;
    };

    dwindle = {
      pseudotile = true;
      preserve_split = true;
    };

    master = {
      new_is_master = true;
    };

    misc = {
      disable_hyprland_logo = true;
      disable_splash_rendering = true;
      animate_manual_resizes = true;
      animate_mouse_windowdragging = true;
      mouse_move_enables_dpms = true;
      key_press_enables_dpms = true;
    };
  };
}
