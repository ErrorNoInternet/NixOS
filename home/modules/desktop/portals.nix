{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.portals;
  inherit (lib) mkEnableOption mkIf;
in {
  options.portals.enable = mkEnableOption "";

  config = mkIf cfg.enable {
    xdg.portal = {
      enable = true;
      xdgOpenUsePortal = true;
      config.common.default = "*";
      extraPortals = [pkgs.xdg-desktop-portal-gtk];
    };
  };
}
