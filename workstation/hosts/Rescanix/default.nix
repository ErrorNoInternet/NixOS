{
  lib,
  pkgs,
  self,
  ...
}: {
  host.id = "3a1f6cc6";

  boot = {
    loader = {
      timeout = lib.mkForce 5;
      grub.memtest86.enable = true;
    };
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
    modules.zfs.enable = true;

    profiles.vmGuest.enable = true;

    desktops = {
      hyprland.enable = true;
      plasma6.enable = true;
    };
  };

  specialisation.lts-kernel = self.lib.systems.mkSpecialisation "lts-kernel" {
    boot.kernelPackages = pkgs.linuxPackages;
  };
}
