{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.workstation.modules.zfs;
  inherit (lib) mkEnableOption mkIf mkDefault;
in {
  options.workstation.modules.zfs.enable = mkEnableOption "";

  config = mkIf cfg.enable {
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

    environment.systemPackages = [pkgs.ioztat];
  };
}
