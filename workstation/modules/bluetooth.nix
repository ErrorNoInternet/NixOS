{
  config,
  lib,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
in {
  options.workstation.modules.bluetooth.enable =
    mkEnableOption ""
    // {
      default = true;
    };

  config = mkIf config.workstation.modules.bluetooth.enable {
    hardware.bluetooth.enable = true;
    services.blueman.enable = true;
  };
}
