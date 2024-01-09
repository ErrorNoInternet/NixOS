{
  config,
  lib,
  ...
}: let
  inherit (lib) mkEnableOption;
in {
  options.profiles.desktop = {
    enable = mkEnableOption "";
    enableNvidia = mkEnableOption "";
  };

  config = {
    cursor.enable = config.profiles.desktop.enable;
    gtkCustomization.enable = config.profiles.desktop.enable;
    mimeapps.image.enable = config.profiles.desktop.enable;

    nvidia.desktopEntries.enable = config.profiles.desktop.enableNvidia;
  };
}
