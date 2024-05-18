{
  config,
  lib,
  ...
}: let
  inherit (lib) mkForce mkOption flip types;
in {
  options.absentFileSystems = mkOption {
    type = with types; listOf str;
    default = [];
  };

  config = {
    fileSystems = flip builtins.removeAttrs config.absentFileSystems {
      "/mnt/nas/drive1" = {
        device = "pix:/mnt/drive1";
        fsType = "nfs";
        options = ["x-systemd.automount" "noauto" "user"];
      };
      "/mnt/nas/drive3" = {
        device = "pix:/mnt/drive3";
        fsType = "nfs";
        options = ["x-systemd.automount" "noauto" "user"];
      };
    };

    services.rpcbind.enable = mkForce false;
  };
}
