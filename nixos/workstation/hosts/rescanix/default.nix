{
  config,
  lib,
  pkgs,
  self,
  ...
}: let
  inherit (lib) mkOverride;
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

  specialisation.lts-kernel = let
    kernelPackages = config.workstation.pkgsKernels.lts;
  in
    self.lib.nixos.mkSpecialisation "lts-kernel" {
      boot.kernelPackages = mkOverride 1100 kernelPackages;
      workstation.modules.zfs = {inherit kernelPackages;};
    };
}
