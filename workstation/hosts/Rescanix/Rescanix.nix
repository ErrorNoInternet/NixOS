{ lib, pkgs, ... }:

{
  networking.hostName = "Rescanix";
  environment.variables.HOSTNAME = "Rescanix";

  boot.loader = {
    timeout = lib.mkForce 5;
    systemd-boot.memtest86.enable = true;
  };
  services.xserver.desktopManager.plasma5.enable = true;
  environment.systemPackages = with pkgs; [];
}
