{
  config,
  lib,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
in {
  options.workstation.desktops.plasma5.enable = mkEnableOption "";

  config = mkIf config.workstation.desktops.plasma5.enable {
    services.xserver.desktopManager.plasma5.enable = true;
  };
}
