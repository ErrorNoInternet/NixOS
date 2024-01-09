{
  config,
  lib,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
in {
  options.profiles.vmGuest.enable = mkEnableOption "";

  config = mkIf config.profiles.vmGuest.enable {
    services.spice-vdagentd.enable = true;
  };
}
