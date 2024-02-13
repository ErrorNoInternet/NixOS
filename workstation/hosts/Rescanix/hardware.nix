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
    initrd.availableKernelModules = [
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
    initrd.kernelModules = [];
    kernelModules = ["kvm-intel"];
    extraModulePackages = [];
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/69696969-6969-6969-6969-696969696969";
      fsType = "btrfs";
      options = ["subvol=@"];
    };
    "/home" = {
      device = "/dev/disk/by-uuid/69696969-6969-6969-6969-696969696969";
      fsType = "btrfs";
      options = ["subvol=@home"];
    };
    "/nix" = {
      device = "/dev/disk/by-uuid/69696969-6969-6969-6969-696969696969";
      fsType = "btrfs";
      options = ["subvol=@nix"];
    };
    "/boot" = {
      device = "/dev/disk/by-uuid/6969-6969";
      fsType = "vfat";
    };
  };

  swapDevices = [];

  networking.useDHCP = lib.mkDefault true;

  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  time.hardwareClockInLocalTime = true;
}
