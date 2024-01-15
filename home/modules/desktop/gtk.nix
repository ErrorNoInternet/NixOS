{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkEnableOption mkOption mkIf;
in {
  options = {
    gtkCustomization = {
      enable = mkEnableOption "";

      theme = mkOption {
        default = {
          name = "Colloid-Dark-${config.colors.schemeName}";
          package = pkgs.colloid-gtk-theme.override {tweaks = ["${lib.strings.toLower config.colors.schemeName}"];};
        };
      };

      iconTheme = mkOption {
        default = {
          name = "Colloid-${lib.strings.toLower config.colors.schemeName}-dark";
          package = pkgs.colloid-icon-theme.override {schemeVariants = ["${lib.strings.toLower config.colors.schemeName}"];};
        };
      };
    };
  };

  config = mkIf config.gtkCustomization.enable {
    gtk = {
      enable = true;
      inherit (config.gtkCustomization) theme;
      inherit (config.gtkCustomization) iconTheme;
    };
  };
}
