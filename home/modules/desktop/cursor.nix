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

  config = mkIf cfg.enable {
    home.pointerCursor = {
      inherit (cfg) name;
      inherit (cfg) package;
      inherit (cfg) size;
      x11.enable = true;
      gtk.enable = true;
    };
  };
}
