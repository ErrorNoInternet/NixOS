{lib, ...}: let
  inherit (lib) mkEnableOption mkOption types;
in {
  imports = [
    ./browser.nix
    ./cursor.nix
    ./font.nix
    ./gtk.nix
    ./mimeapps.nix
    ./nvidia.nix
    ./opacity.nix
    ./terminal.nix
    ./wallpaper.nix
  ];

  options.desktop = {
    modifierKey = mkOption {
      default = "SUPER";
      type = types.str;
    };

    monitors = mkOption {
      type = types.listOf (types.submodule {
        options = {
          name = mkOption {
            default = "";
            type = types.str;
          };
          width = mkOption {
            type = with types; nullOr int;
          };
          height = mkOption {
            type = with types; nullOr int;
          };
          refreshRate = mkOption {
            default = 0;
            type = types.int;
          };
          x = mkOption {
            default = 0;
            type = with types; nullOr int;
          };
          y = mkOption {
            default = 0;
            type = with types; nullOr int;
          };
          scale = mkOption {
            default = 1;
            type = with types; nullOr int;
          };
          enabled = mkEnableOption "";
        };
      });
    };
  };
}
