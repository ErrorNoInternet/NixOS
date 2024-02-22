{
  config,
  lib,
  pkgs,
  ...
}: {
  wayland.windowManager.hyprland.settings.exec-once = [
    "hyprctl setcursor ${config.cursor.name} ${builtins.toString config.cursor.size}"

    "sleep 0.5 && waybar"
    "swaync"
    (lib.mkIf config.wallpaper.enable "hyprpaper")

    "${lib.getExe pkgs.hyprland-autoname-workspaces}"
    "${pkgs.wl-clipboard}/bin/wl-paste --watch ${lib.getExe pkgs.cliphist} -max-items 1000 store"

    "swayidle before-sleep 'swaylock --grace 0 --fade-in 1'"
    "swayidle timeout 570 'swaylock --grace 30 --fade-in 30' timeout 1200 'hyprctl dispatch dpms off'"
  ];
}
