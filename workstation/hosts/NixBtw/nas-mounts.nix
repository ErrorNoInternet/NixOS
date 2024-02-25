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
    "/mnt/nas-drive1" = {
      device = "Pix.local:/mnt/drive1";
      fsType = "nfs";
      options = ["x-systemd.automount" "noauto"];
    };
    "/mnt/nas-drive3" = {
      device = "Pix.local:/mnt/drive3";
      fsType = "nfs";
      options = ["x-systemd.automount" "noauto"];
    };
  };
}
