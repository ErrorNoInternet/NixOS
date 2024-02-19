{
  config,
  lib,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot = {
    initrd = {
      availableKernelModules = [
        "ahci"
        "ehci_pci"
        "rtsx_pci_sdmmc"
        "sd_mod"
        "sr_mod"
        "usb_storage"
        "virtio_blk"
        "virtio_pci"
        "xhci_pci"
      ];
      kernelModules = [];
    };
    kernelModules = ["kvm-intel"];
    extraModulePackages = [];
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/10101010-1010-1010-1010-101010101010";
      fsType = "btrfs";
      options = ["subvol=@"];
    };
    "/home" = {
      device = "/dev/disk/by-uuid/10101010-1010-1010-1010-101010101010";
      fsType = "btrfs";
      options = ["subvol=@home"];
    };
    "/nix" = {
      device = "/dev/disk/by-uuid/10101010-1010-1010-1010-101010101010";
      fsType = "btrfs";
      options = ["subvol=@nix"];
    };
    "/boot" = {
      device = "/dev/disk/by-uuid/1010-1010";
      fsType = "vfat";
    };
  };
  swapDevices = [];

  networking.useDHCP = lib.mkDefault true;

  time.hardwareClockInLocalTime = true;

  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
