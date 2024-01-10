{
  config,
  lib,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
in {
  options.profiles.desktop = {
    enable = mkEnableOption "";
    enableNvidia = mkEnableOption "";
  };

  config = mkIf config.profiles.desktop.enable {
    cursor.enable = true;
    gtkCustomization.enable = true;
    mimeapps.image.enable = true;

    nvidia.desktopEntries.enable = config.profiles.desktop.enableNvidia;
  };
}
