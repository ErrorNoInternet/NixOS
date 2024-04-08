{
  config,
  lib,
  ...
}: let
  cfg = config.workstation.desktops.plasma6;
  inherit (lib) mkEnableOption mkIf;
in {
  options.workstation.desktops.plasma6.enable = mkEnableOption "";

  config = mkIf cfg.enable {
    services.desktopManager.plasma6.enable = true;
  };
}
