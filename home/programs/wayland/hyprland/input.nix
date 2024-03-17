{config, ...}: {
  wayland.windowManager.hyprland.settings = {
    "$mod" = config.desktop.modifierKey;

    input = {
      touchpad = {
        natural_scroll = true;
        disable_while_typing = false;
      };
      follow_mouse = 1;
      accel_profile = "flat";
      sensitivity = 0.75;
      repeat_delay = 150;
      repeat_rate = 50;
    };

    gestures = {
      workspace_swipe = true;
      workspace_swipe_forever = true;
      workspace_swipe_cancel_ratio = 0.25;
      workspace_swipe_min_speed_to_force = 10;
    };
  };
}
