{
  config,
  lib,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = [
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
  boot.initrd.kernelModules = [];
  boot.kernelModules = ["kvm-intel"];
  boot.extraModulePackages = [];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/69696969-6969-6969-6969-696969696969";
    fsType = "btrfs";
  };

  fileSystems."/efi" = {
    device = "systemd-1";
    fsType = "autofs";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/6969-6969";
    fsType = "vfat";
  };

  swapDevices = [];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp3s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp5s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
