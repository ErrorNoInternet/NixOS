{
  config,
  lib,
  ...
}: let
  cfg = config.workstation.modules.bluetooth;
  inherit (lib) mkEnableOption mkIf;
in {
  options.workstation.modules.bluetooth.enable =
    mkEnableOption ""
    // {
      default = true;
    };

  config = mkIf cfg.enable {
    hardware.bluetooth.enable = true;
    services.blueman.enable = true;
  };
}
