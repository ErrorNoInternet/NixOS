{
  config,
  lib,
  ...
}: let
  inherit (lib) mkOption flip;
in {
  options.absentFileSystems = mkOption {
    default = [];
  };

  config.fileSystems = flip builtins.removeAttrs config.absentFileSystems {
    "/mnt/pi-drive1" = {
      device = "192.168.0.100:/mnt/drive1";
      fsType = "nfs";
      options = ["x-systemd.automount" "noauto"];
    };
    "/mnt/pi-drive3" = {
      device = "192.168.0.100:/mnt/drive3";
      fsType = "nfs";
      options = ["x-systemd.automount" "noauto"];
    };
  };
}
