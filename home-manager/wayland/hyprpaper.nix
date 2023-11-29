{
  custom,
  lib,
  pkgs,
  ...
}: {
  home.packages = [pkgs.hyprpaper];
  home.file.".config/hypr/hyprpaper.conf".text = ''
    ipc = off
    preload = ~/pictures/wallpapers/${lib.strings.toLower custom.predefinedColorScheme}/wallpaper1.png
    wallpaper = ,~/pictures/wallpapers/${lib.strings.toLower custom.predefinedColorScheme}/wallpaper1.png
  '';
}
