{
  config,
  lib,
  self,
  ...
}: let
  cfg = config.workstation.zfs;
  inherit (lib) mkIf;
in {
  config = mkIf cfg.enable {
    age.secrets.zed_workstation.file = "${self}/secrets/zed_workstation.age";

    services.zfs.zed.settings = {
      ZED_NOTIFY_INTERVAL_SECS = 60;
      ZED_NOTIFY_VERBOSE = 1;
    };

    environment.etc."zfs/zed.d/zed.rc".text = ''
      source ${config.age.secrets.zed_workstation.path}
    '';
  };
}
