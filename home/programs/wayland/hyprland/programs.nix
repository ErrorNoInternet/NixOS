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

      "waybar"
      "wl-paste --watch cliphist -max-items 1000 store"

      "swayidle before-sleep 'swaylock --grace 0 --fade-in 0'"
      "swayidle timeout 570 'swaylock --grace 30 --fade-in 30' timeout 1200 'hyprctl dispatch dpms off'"
    ]
    ++ optional config.wallpaper.enable "swaybg -m fill -i ${config.wallpaper.path}";
}
