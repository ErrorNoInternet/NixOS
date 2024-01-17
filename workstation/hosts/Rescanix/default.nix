{
  config,
  lib,
  pkgs,
  ...
}: {
  host.id = "3a1f6cc6";

  boot = {
    loader = {
      timeout = lib.mkForce 5;
      systemd-boot = {
        memtest86.enable = true;
        netbootxyz.enable = true;
      };
    };
    kernelParams = ["boot.shell_on_fail"];
    supportedFilesystems = [
      "apfs"
      "exfat"
      "f2fs"
      "nilfs2"
      "xfs"
    ];
  };

  services.printing = {
    enable = true;
    drivers = [pkgs.hplip];
  };

  workstation = {
    # TODO: remove once zfs supports 6.7
    modules.zfs.enable =
      if
        (builtins.compareVersions
          config.boot.zfs.package.latestCompatibleLinuxPackages.kernel.version
          pkgs.linuxPackages_latest.kernel.version)
        == -1
      then false
      else true;

    profiles.vmGuest.enable = true;

    desktops = {
      hyprland.enable = true;
      plasma5.enable = true;
    };
  };
}
