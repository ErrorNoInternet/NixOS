{
  config,
  inputs,
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
      default = "${lib.strings.toLower config.colors.schemeName}/1.png";
      type = types.str;
    };
  };

  config = mkIf config.wallpaper.enable {
    home = {
      packages = [inputs.hyprpaper.packages.${pkgs.system}.hyprpaper];
      file = {
        "pictures/wallpapers".source = ../../../other/wallpapers;

        "${config.xdg.configHome}/hypr/hyprpaper.conf".text = ''
          preload = ${pathPrefix}/${config.wallpaper.path}
          wallpaper = ,${pathPrefix}/${config.wallpaper.path}
        '';
      };
    };
  };
}
