{
  config,
  lib,
  ...
}: let
  cfg = config.workstation.bluetooth;
  inherit (lib) mkEnableOption mkIf;
in {
  options.workstation.bluetooth.enable =
    mkEnableOption "" // {default = true;};

  config = mkIf cfg.enable {
    hardware.bluetooth.enable = true;
    services.blueman.enable = true;
  };
}
