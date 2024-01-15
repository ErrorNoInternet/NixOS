{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkEnableOption mkOption mkIf types;
in {
  options.cursor = {
    enable = mkEnableOption "";

    name = mkOption {
      default = "Bibata-Modern-Classic";
      type = types.str;
    };

    package = mkOption {
      default = pkgs.bibata-cursors;
      type = types.package;
    };

    size = mkOption {
      default = 16;
      type = types.int;
    };
  };

  config = mkIf config.cursor.enable {
    home.pointerCursor = {
      inherit (config.cursor) name;
      inherit (config.cursor) package;
      inherit (config.cursor) size;
      x11.enable = true;
      gtk.enable = true;
    };
  };
}
