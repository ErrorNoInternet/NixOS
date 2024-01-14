{
  lib,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  nixpkgs.overlays = let
    ubootWithBtrfsAndZstd = _: {
      extraConfig = ''
        CONFIG_CMD_BTRFS=y
        CONFIG_ZSTD=y

        CONFIG_BOOTCOMMAND="setenv boot_prefixes /@boot/ /@/ /boot/ /; run distro_bootcmd;"
      '';
    };
  in [
    (_: super: {
      ubootRaspberryPi3_64bit = super.ubootRaspberryPi3_64bit.overrideAttrs ubootWithBtrfsAndZstd;
      ubootRaspberryPi4_64bit = super.ubootRaspberryPi4_64bit.overrideAttrs ubootWithBtrfsAndZstd;
    })
  ];

  boot = {
    kernelParams = [
      "console=ttyS0,115200n8"
      "console=ttyAMA0,115200n8"
      "console=tty0"
      "root=/dev/disk/by-label/NIXOS_SD"
      "rootfstype=btrfs"
      "rootflags=subvol=@"
      "rootwait"
    ];
    initrd.kernelModules = ["zstd" "btrfs"];
  };

  fileSystems = let
    opts = ["noatime"];
    fsType = "btrfs";
    device = "/dev/disk/by-label/NIXOS_SD";
  in {
    "/" = {
      inherit fsType device;
      options = opts ++ ["subvol=@"];
    };
    "/boot" = {
      inherit fsType device;
      options = opts ++ ["subvol=@boot"];
    };
    "/nix" = {
      inherit fsType device;
      options = opts ++ ["subvol=@nix"];
    };
    "/var" = {
      inherit fsType device;
      options = opts ++ ["subvol=@var"];
    };
    "/home" = {
      inherit fsType device;
      options = opts ++ ["subvol=@home"];
    };
    "/.snapshots" = {
      inherit fsType device;
      options = opts ++ ["subvol=@snapshots"];
    };
    "/boot/firmware" = {
      device = "/dev/disk/by-label/FIRMWARE";
      fsType = "vfat";
      options = ["nofail" "noauto"];
    };
  };

  powerManagement.cpuFreqGovernor =
    lib.mkDefault
    "ondemand";
  nixpkgs.hostPlatform = lib.mkDefault "aarch64-linux";
}
