{
  config,
  lib,
  pkgs,
  self,
  ...
}: let
  cfg = config.workstation.zfs;
  inherit (lib) mkEnableOption mkIf mkDefault;
in {
  options.workstation.zfs = {
    enable = mkEnableOption "";
  };

  config = mkIf cfg.enable {
    age.secrets.workstation-zed.file = "${self}/secrets/workstation-zed.age";

    boot = {
      loader.grub.zfsSupport = true;

      kernelPackages =
        mkDefault config.boot.zfs.package.latestCompatibleLinuxPackages;
      supportedFilesystems = ["zfs"];

      zfs.forceImportRoot = false;
      extraModprobeConfig = ''
        options zfs zfs_bclone_enabled=1
      '';
    };

    services.zfs.zed.settings = {
      ZED_NOTIFY_INTERVAL_SECS = 60;
      ZED_NOTIFY_VERBOSE = 1;
    };

    environment = {
      systemPackages = [pkgs.ioztat];

      etc."zfs/zed.d/zed.rc".text = ''
        source ${config.age.secrets.workstation-zed.path}
      '';
    };
  };
}
