{
  config,
  lib,
  pkgs,
  self,
  ...
}: let
  inherit (lib) mkEnableOption mkOption mkIf;
in {
  options.toolkits.gtk = {
    enable = mkEnableOption "";

    theme = mkOption {
      default = {
        name = "Nordic-darker";
        package = self.legacyPackages.${pkgs.system}.nordic;
      };
    };

    iconTheme = mkOption {
      default = {
        name = "Colloid-${lib.strings.toLower config.colors.schemeName}-dark";
        package = pkgs.colloid-icon-theme.override {schemeVariants = ["${lib.strings.toLower config.colors.schemeName}"];};
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
