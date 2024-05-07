{
  config,
  lib,
  ...
}: let
  cfg = config.workstation.desktops.gnome;
  inherit (lib) mkEnableOption mkIf;
in {
  options.workstation.desktops.gnome.enable = mkEnableOption "";

  config = mkIf cfg.enable {
    services.xserver.desktopManager.gnome.enable = true;
  };
}
