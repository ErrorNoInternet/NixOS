{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkEnableOption mkOption mkIf types;

  pathPrefix = "~/pictures/wallpapers/";
in {
  options.wallpaper = {
    enable = mkEnableOption "";

    path = mkOption {
      default = "${lib.strings.toLower config.colors.schemeName}/wallpaper1.png";
      type = types.str;
    };
  };

  config = mkIf config.wallpaper.enable {
    home = {
      packages = [pkgs.hyprpaper];
      file = {
        "pictures/wallpapers".source = ../../../other/wallpapers;

        ".config/hypr/hyprpaper.conf".text = ''
          preload = ${pathPrefix}/${config.wallpaper.path}
          wallpaper = ,${pathPrefix}/${config.wallpaper.path}
        '';
      };
    };
  };
}
