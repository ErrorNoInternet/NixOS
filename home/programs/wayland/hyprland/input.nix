{config, ...}: {
  wayland.windowManager.hyprland.settings = {
    "$mod" = config.desktop.modifierKey;

    input = {
      touchpad = {
        natural_scroll = true;
        disable_while_typing = false;
      };
      kb_layout = "us";
      follow_mouse = 1;
      accel_profile = "flat";
      sensitivity = 0.75;
      repeat_delay = 150;
      repeat_rate = 50;
    };

    gestures = {
      workspace_swipe = true;
    };
  };
}
