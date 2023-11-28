{
  config,
  lib,
  ...
}: {
  environment.variables.HOSTNAME = "Rescanix";
  networking = {
    hostName = "Rescanix";
    hostId = "3a1f6cc6";
  };

  boot.loader = {
    timeout = lib.mkForce 5;
    systemd-boot = {
      memtest86.enable = true;
      netbootxyz.enable = true;
    };
  };
  boot.kernelPackages = config.boot.zfs.package.latestCompatibleLinuxPackages;
  services.xserver.desktopManager.plasma5.enable = true;
}
