{
  lib,
  pkgs,
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
    kernel.patches.removeUnused = false;

    zfs.enable = true;

    sddm.enable = true;

    profiles.qemuGuest.enable = true;

    desktops = {
      gnome.enable = true;
      hyprland.enable = true;
      plasma5.enable = true;
    };
  };
}
