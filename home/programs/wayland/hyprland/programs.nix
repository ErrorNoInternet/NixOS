{
  config,
  lib,
  ...
}: let
  inherit (lib) optional;
in {
  wayland.windowManager.hyprland.settings.exec-once =
    [
      "hyprctl setcursor ${config.cursor.name} ${builtins.toString config.cursor.size}"

      "wl-paste --watch cliphist -max-items 1000 store"
      "sleep 0.25 && waybar"

      "swayidle before-sleep 'swaylock --grace 0 --fade-in 0'"
      "swayidle timeout 570 'swaylock --grace 30 --fade-in 30' timeout 1200 'hyprctl dispatch dpms off'"
    ]
    ++ optional config.wallpaper.enable "swaybg -i ${config.wallpaper.path}";
}
