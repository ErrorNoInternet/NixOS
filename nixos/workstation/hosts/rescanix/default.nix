{
  config,
  lib,
  pkgs,
  self,
  ...
}: {
  time.hardwareClockInLocalTime = true;

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
    sddm.enable = true;

    profiles.qemuGuest.enable = true;

    desktops = {
      hyprland.enable = true;
      plasma5.enable = true;
    };
  };

  specialisation.lts-kernel = self.lib.nixos.mkSpecialisation "lts-kernel" {
    workstation.modules.zfs.kernelPackages = config.workstation.pkgsKernels.lts;
  };
}