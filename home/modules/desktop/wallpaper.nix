{
  config,
  lib,
  pkgs,
  self,
  ...
}: let
  cfg = config.wallpaper;
  inherit (lib) mkEnableOption mkOption mkIf types strings;

  wallpapersPath = "~/pictures/wallpapers";
in {
  options.wallpaper = {
    enable = mkEnableOption "" // {default = config.profiles.desktop.enable;};

    path = mkOption {
      type = types.str;
      default = "${wallpapersPath}/${strings.toLower config.colors.schemeName}/0.png";
    };
  };

  config = mkIf cfg.enable {
    home = {
      file."pictures/wallpapers".source = "${self}/other/wallpapers";

      packages = [pkgs.swaybg];
    };
  };
}
