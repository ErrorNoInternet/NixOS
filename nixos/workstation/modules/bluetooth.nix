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
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = false;
    };

    services.blueman.enable = true;

    shared.impermanence.directories = ["/var/lib/bluetooth"];
  };
}
