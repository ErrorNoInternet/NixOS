{
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
      # TODO: wait for kernel 6.7
      # "bcachefs"
      "exfat"
      "xfs"
    ];
  };

  services.printing = {
    enable = true;
    drivers = [pkgs.hplip];
  };

  workstation = {
    modules = {
      zfs.enable = true;
    };

    profiles.vmGuest.enable = true;

    desktops = {
      hyprland.enable = true;
      plasma5.enable = true;
    };
  };
}
