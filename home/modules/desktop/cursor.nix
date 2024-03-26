{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.cursor;
  inherit (lib) mkEnableOption mkOption mkIf types;
in {
  options.cursor = {
    enable = mkEnableOption "";

    name = mkOption {
      type = types.str;
      default = "Bibata-Modern-Classic";
    };

    package = mkOption {
      type = types.package;
      default = pkgs.bibata-cursors;
    };

    size = mkOption {
      type = types.int;
      default = 16;
    };
  };

  config = mkIf cfg.enable {
    home.pointerCursor = {
      inherit (cfg) name package size;
      x11.enable = true;
      gtk.enable = true;
    };
  };
}
