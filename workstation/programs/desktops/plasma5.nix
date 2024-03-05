{ config, lib, ... }:
let
  cfg = config.workstation.desktops.plasma5;
  inherit (lib) mkEnableOption mkIf;
in
{
  options.workstation.desktops.plasma5.enable = mkEnableOption "";

  config = mkIf cfg.enable { services.xserver.desktopManager.plasma5.enable = true; };
}
