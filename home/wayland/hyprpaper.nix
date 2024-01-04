{
  custom,
  lib,
  pkgs,
  ...
}: {
  home = {
    packages = [pkgs.hyprpaper];
    file.".config/hypr/hyprpaper.conf".text = ''
      preload = ~/pictures/wallpapers/${lib.strings.toLower custom.predefinedColorScheme}/wallpaper1.png
      wallpaper = ,~/pictures/wallpapers/${lib.strings.toLower custom.predefinedColorScheme}/wallpaper1.png
    '';
  };
}
