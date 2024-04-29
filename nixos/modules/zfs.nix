{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.nixos.zfs;
  inherit (lib) mkEnableOption mkIf;
in {
  options.nixos.zfs.enable =
    mkEnableOption ""
    // {
      default =
        config.workstation.zfs.enable
        or config.server.zfs.enable;
    };

  config = mkIf cfg.enable {
    boot.supportedFilesystems = ["zfs"];

    environment = {
      systemPackages = [pkgs.ioztat];

      variables.ZFS_COLOR = 1;
    };
  };
}
