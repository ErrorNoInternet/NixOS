{ lib, pkgs, ... }:

{
  environment.variables.HOSTNAME = "NixBtw";
  networking = {
    hostName = "NixBtw";
    hostId = "102f58f5";
  };

  fileSystems."/mnt/data" = {
    device = "/dev/disk/by-uuid/b5a83e11-2299-4b20-b324-d4484014f2d3";
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

  boot.kernelPatches = [
    {
      name = "ftrace";
      patch = null;
      extraConfig = ''
        CONFIG_FUNCTION_TRACER=y
        CONFIG_FUNCTION_GRAPH_TRACER=y
        CONFIG_STACK_TRACER=y
        CONFIG_DYNAMIC_FTRACE=y
      '';
    }
    {
      name = "penguins";
      patch = null;
      extraConfig = ''
        CONFIG_LOGO=y
      '';
    }
  ];
}
