{
  config,
  lib,
  pkgs,
  ...
}: {
  environment.variables.HOSTNAME = "Rescanix";
  networking = {
    hostName = "Rescanix";
    hostId = "3a1f6cc6";
  };

  boot = {
    loader = {
      timeout = lib.mkForce 5;
      systemd-boot = {
        memtest86.enable = true;
        netbootxyz.enable = true;
      };
    };
    kernelPackages = config.boot.zfs.package.latestCompatibleLinuxPackages;
  };

  services.printing = {
    enable = true;
    drivers = with pkgs; [hplip];
  };
  services.xserver.desktopManager.plasma5.enable = true;
}
