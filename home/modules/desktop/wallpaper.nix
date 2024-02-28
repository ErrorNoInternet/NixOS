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
    enable = mkEnableOption "" // {default = true;};

    path = mkOption {
      default = "${wallpapersPath}/${strings.toLower config.colors.schemeName}/1.png";
      type = types.str;
    };
  };

  config = mkIf cfg.enable {
    home = {
      file."pictures/wallpapers".source = "${self}/other/wallpapers";
      packages = [pkgs.swaybg];
    };
  };
}
