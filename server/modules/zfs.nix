{
  config,
  lib,
  pkgs,
  self,
  ...
}: let
  cfg = config.server.zfs;
  inherit (lib) mkEnableOption mkIf mkDefault;
in {
  options.server.zfs = {
    enable = mkEnableOption "";
  };

  config = mkIf cfg.enable {
    age.secrets.server-zed.file = "${self}/secrets/server-zed.age";

    boot = {
      kernelPackages = let
        current = pkgs.linuxPackages;
        zfsSupported = config.boot.zfs.package.latestCompatibleLinuxPackages;
      in
        mkDefault (
          if ((builtins.compareVersions current.kernel.version zfsSupported.kernel.version) >= 0)
          then current
          else builtins.trace "using older ZFS-supported kernel" zfsSupported
        );

      supportedFilesystems = ["zfs"];

      zfs.forceImportRoot = false;
    };

    services.zfs.zed.settings = {
      ZED_NOTIFY_INTERVAL_SECS = 60;
      ZED_NOTIFY_VERBOSE = 1;
    };

    environment = {
      systemPackages = [pkgs.ioztat];

      etc."zfs/zed.d/zed.rc".text = ''
        source ${config.age.secrets.server-zed.path}
      '';
    };
  };
}
