# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{
  config,
  lib,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = ["xhci_pci" "ehci_pci" "ahci" "usb_storage" "sd_mod" "sr_mod" "rtsx_pci_sdmmc"];
  boot.initrd.kernelModules = [];
  boot.kernelModules = ["kvm-intel"];
  boot.extraModulePackages = [];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/47502804-f00d-4f0c-b63f-bd7971039dbb";
    fsType = "btrfs";
    options = ["subvol=@"];
  };

  boot.initrd.luks.devices."luks-NixBtw".device = "/dev/disk/by-uuid/d3f64a12-e62f-43e2-8351-417602765f32";

  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/47502804-f00d-4f0c-b63f-bd7971039dbb";
    fsType = "btrfs";
    options = ["subvol=@home"];
  };

  fileSystems."/nix" = {
    device = "/dev/disk/by-uuid/47502804-f00d-4f0c-b63f-bd7971039dbb";
    fsType = "btrfs";
    options = ["subvol=@nix"];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/A463-84E1";
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
