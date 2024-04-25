{
  config,
  lib,
  ...
}: let
  cfg = config.server.zfs;
  inherit (lib) mkIf;
in {
  config = mkIf cfg.enable {
    boot.zfs = {
      forceImportRoot = false;
    };
  };
}
