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
    kernelModules = ["kvm-intel"];
    extraModulePackages = [];
    initrd = {
      availableKernelModules = ["xhci_pci" "ehci_pci" "ahci" "usb_storage" "sd_mod" "sr_mod" "rtsx_pci_sdmmc"];
      kernelModules = [];

      luks.devices."luks-NixBtw" = {
        device = "/dev/disk/by-uuid/d3f64a12-e62f-43e2-8351-417602765f32";
        allowDiscards = true;
      };
    };
  };

  fileSystems = let 
    defaultOptions = ["ssd_spread"];
    device = "/dev/disk/by-uuid/47502804-f00d-4f0c-b63f-bd7971039dbb";
    fsType = "btrfs";
  in {
    "/" = {
      inherit device fsType;
      options = ["subvol=@"] ++ defaultOptions;
    };
    "/home" = {
      inherit device fsType;
      options = ["subvol=@home"] ++ defaultOptions;
    };
    "/nix" = {
      inherit device fsType;
      options = ["subvol=@nix"] ++ defaultOptions;
    };
    "/boot" = {
      device = "/dev/disk/by-uuid/A463-84E1";
      fsType = "vfat";
    };
  };

  swapDevices = [];

  networking.useDHCP = lib.mkDefault true;

  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
