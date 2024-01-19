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
    mimeapps.image.enable = true;
    toolkits = {
      gtk.enable = true;
      qt.enable = true;
    };

    nvidia.desktopEntries.enable = config.profiles.desktop.enableNvidia;
  };
}
