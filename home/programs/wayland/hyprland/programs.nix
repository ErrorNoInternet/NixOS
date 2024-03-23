{
  config,
  lib,
  pkgs,
  ...
}: {
  wayland.windowManager.hyprland.settings.exec-once = with lib; [
    "hyprctl setcursor ${config.cursor.name} ${builtins.toString config.cursor.size}"
    (mkIf config.wallpaper.enable "swaybg -i ${config.wallpaper.path}")

    "${pkgs.wl-clipboard}/bin/wl-paste --watch ${getExe pkgs.cliphist} -max-items 1000 store"
    "sleep 0.5 && waybar"
    "swaync"

    "swayidle before-sleep 'swaylock --grace 0 --fade-in 0'"
    "swayidle timeout 570 'swaylock --grace 30 --fade-in 30' timeout 1200 'hyprctl dispatch dpms off'"
  ];
}
