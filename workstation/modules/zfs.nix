{
  config,
  lib,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
in {
  options.workstation.modules.zfs.enable = mkEnableOption "";

  config = mkIf config.workstation.modules.zfs.enable {
    boot = {
      kernelPackages = config.boot.zfs.package.latestCompatibleLinuxPackages;
      supportedFilesystems = ["zfs"];

      zfs.forceImportRoot = false;
    };
  };
}
