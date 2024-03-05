{ config, lib, ... }:
let
  inherit (lib) mkEnableOption mkIf;
in
{
  options.workstation.profiles.vmGuest.enable = mkEnableOption "";

  config = mkIf config.workstation.profiles.vmGuest.enable { services.spice-vdagentd.enable = true; };
}
