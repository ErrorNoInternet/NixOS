{
  config,
  lib,
  pkgs,
  self',
  ...
}: let
  inherit (lib) mkEnableOption mkOption mkIf;
in {
  options.toolkits.gtk = {
    enable = mkEnableOption "";

    theme = mkOption {
      default = {
        name = "Nordic-darker";
        package = self'.packages.gtk-theme-nordic;
      };
    };

    iconTheme = mkOption {
      default = {
        name = "Colloid-nord-dark";
        package = pkgs.colloid-icon-theme.override {schemeVariants = ["nord"];};
      };
    };
  };

  config = mkIf config.toolkits.gtk.enable {
    gtk = {
      enable = true;
      inherit (config.toolkits.gtk) theme;
      inherit (config.toolkits.gtk) iconTheme;
    };
  };
}
