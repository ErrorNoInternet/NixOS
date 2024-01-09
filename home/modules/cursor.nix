{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    cursor = {
      enable = lib.mkEnableOption "";

      name = lib.mkOption {
        default = "Bibata-Modern-Classic";
        type = lib.types.str;
      };

      package = lib.mkOption {
        default = pkgs.bibata-cursors;
        type = lib.types.package;
      };

      size = lib.mkOption {
        default = 16;
        type = lib.types.int;
      };
    };
  };

  config = lib.mkIf config.cursor.enable {
    home.pointerCursor = {
      name = config.cursor.name;
      package = config.cursor.package;
      size = config.cursor.size;
      x11.enable = true;
      gtk.enable = true;
    };
  };
}
