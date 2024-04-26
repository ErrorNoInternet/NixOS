{
  config,
  lib,
  ...
}: let
  cfg = config.workstation.zfs;
  inherit (lib) mkIf;
in {
  config = mkIf cfg.enable {
    boot = {
      extraModprobeConfig = ''
        options zfs zfs_bclone_enabled=1 l2arc_mfuonly=1
      '';

      zfs = {
        forceImportRoot = false;
      };
    };
  };
}
