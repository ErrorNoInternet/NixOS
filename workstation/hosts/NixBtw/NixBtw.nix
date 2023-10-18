{ lib, pkgs, ... }:

{
  networking.hostName = "NixBtw";
  environment.variables.HOSTNAME = "NixBtw";

  fileSystems."/mnt/data" = {
    device = "/dev/disk/by-uuid/ffabee31-a399-41ac-b803-d07215f60c33";
    fsType = "auto";
    options = [ "defaults" "nofail" ];
  };
  fileSystems."/mnt/pi-drive1" = {
    device = "192.168.0.100:/mnt/drive1";
    fsType = "nfs";
    options = [ "x-systemd.automount" "noauto" ];
  };
  fileSystems."/mnt/pi-drive3" = {
    device = "192.168.0.100:/mnt/drive3";
    fsType = "nfs";
    options = [ "x-systemd.automount" "noauto" ];
  };

  nix.gc.automatic = false;

  services.udev.extraRules = ''
    SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1770", ATTRS{idProduct}=="ff00", TAG+="uaccess", TAG+="MSI_3Zone_Laptop"
  '';

  systemd.services.lock_intel_gpu_frequency = {
    path = with pkgs; [
      intel-gpu-tools
    ];
    script = "intel_gpu_frequency -m";
    wantedBy = [ "multi-user.target" ];
  };
}
