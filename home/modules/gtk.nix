{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    gtkCustomization = {
      enable = lib.mkEnableOption "";

      theme = lib.mkOption {
        default = {
          name = "Colloid-Dark-${config.colors.schemeName}";
          package = pkgs.colloid-gtk-theme.override {tweaks = ["${lib.strings.toLower config.colors.schemeName}"];};
        };
      };

      iconTheme = lib.mkOption {
        default = {
          name = "Colloid-${lib.strings.toLower config.colors.schemeName}-dark";
          package = pkgs.colloid-icon-theme.override {schemeVariants = ["${lib.strings.toLower config.colors.schemeName}"];};
        };
      };
    };
  };

  config = lib.mkIf config.gtkCustomization.enable {
    gtk = {
      enable = true;
      theme = config.gtkCustomization.theme;
      iconTheme = config.gtkCustomization.iconTheme;
    };
  };
}
