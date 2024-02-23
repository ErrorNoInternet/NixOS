{
  config,
  lib,
  ...
}: let
  cfg = config.workstation.modules.zfs;
  inherit (lib) mkEnableOption mkIf mkDefault;
in {
  options.workstation.modules.zfs.enable = mkEnableOption "";

  config = mkIf cfg.enable {
    boot = {
      kernelPackages = mkDefault config.boot.zfs.package.latestCompatibleLinuxPackages;
      supportedFilesystems = ["zfs"];

      zfs.forceImportRoot = false;
    };
  };
}
