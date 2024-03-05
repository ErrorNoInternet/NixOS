{
  config,
  lib,
  modulesPath,
  ...
}:
{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot = {
    initrd.availableKernelModules = [
      "xhci_pci"
      "ehci_pci"
      "ahci"
      "usb_storage"
      "sd_mod"
      "sr_mod"
      "rtsx_pci_sdmmc"
    ];
    kernelModules = [ "kvm-intel" ];
  };

  fileSystems = {
    "/" = {
      device = "NixBtw/root";
      fsType = "zfs";
    };
    "/nix" = {
      device = "NixBtw/nix";
      fsType = "zfs";
    };
    "/var" = {
      device = "NixBtw/var";
      fsType = "zfs";
    };
    "/home" = {
      device = "NixBtw/home";
      fsType = "zfs";
    };
    "/boot" = {
      device = "/dev/disk/by-uuid/B3A5-5FA4";
      fsType = "vfat";
    };
  };

  networking.useDHCP = lib.mkDefault true;

  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
