{
  config,
  lib,
  pkgs,
  self',
  ...
}: let
  cfg = config.toolkits.gtk;
  inherit (lib) mkEnableOption mkOption mkIf;
in {
  options.toolkits.gtk = {
    enable = mkEnableOption "";

    theme = mkOption {
      default = {
        name = "Nordic-darker";
        package = self'.packages.gtkTheme-nordic;
      };
    };

    iconTheme = mkOption {
      default = {
        name = "Colloid-${lib.strings.toLower config.colors.schemeName}-dark";
        package = pkgs.colloid-icon-theme.override {schemeVariants = ["${lib.strings.toLower config.colors.schemeName}"];};
      };
    };
  };

  config = mkIf cfg.enable {
    gtk = {
      enable = true;
      inherit (cfg) theme iconTheme;
    };
  };
}
