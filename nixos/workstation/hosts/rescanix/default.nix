{
  config,
  lib,
  pkgs,
  self,
  ...
}: let
  inherit (lib) mkForce;
in {
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

  nixos.wireless.enable = mkForce false;
  networking.networkmanager.enable = true;

  services.printing = {
    enable = true;
    drivers = [pkgs.hplip];
  };

  workstation = {
    kernel.patches.removeUnused = false;

    zfs.enable = true;

    sddm.enable = true;

    profiles.qemuGuest.enable = true;

    desktops = {
      hyprland.enable = true;
      plasma5.enable = true;
    };
  };

  specialisation = {
    kernel-lts = self.lib.nixos.mkSpecialisation "kernel-lts" {
      workstation.zfs.kernelPackages = config.workstation.kernel.availablePackages.lts;
    };

    kernel-lts-515 = self.lib.nixos.mkSpecialisation "kernel-lts-515" {
      workstation.zfs.kernelPackages = config.workstation.kernel.availablePackages.lts-515;
    };

    kernel-lts-510 = self.lib.nixos.mkSpecialisation "kernel-lts-510" {
      workstation.zfs.kernelPackages = config.workstation.kernel.availablePackages.lts-510;
    };
  };
}
