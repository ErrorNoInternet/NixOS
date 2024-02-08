{
  config,
  inputs',
  lib,
  ...
}: let
  cfg = config.wallpaper;
  inherit (lib) mkEnableOption mkOption mkIf types strings;

  wallpapersPath = "~/pictures/wallpapers";
in {
  options.wallpaper = {
    enable = mkEnableOption "";

    path = mkOption {
      default = "${strings.toLower config.colors.schemeName}/1.png";
      type = types.str;
    };
  };

  config = mkIf cfg.enable {
    home = {
      packages = [inputs'.hyprpaper.packages.hyprpaper];
      file = {
        "pictures/wallpapers".source = ../../../other/wallpapers;

        "${config.xdg.configHome}/hypr/hyprpaper.conf".text = ''
          preload = ${wallpapersPath}/${cfg.path}
          wallpaper = ,${wallpapersPath}/${cfg.path}
        '';
      };
    };
  };
}
