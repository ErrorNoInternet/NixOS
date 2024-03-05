{ lib, modulesPath, ... }:
{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  nixpkgs.overlays =
    let
      ubootWithBtrfsAndZstd = _: {
        extraConfig = ''
          CONFIG_CMD_BTRFS=y
          CONFIG_ZSTD=y

          CONFIG_BOOTCOMMAND="setenv boot_prefixes /@boot/ /@/ /boot/ /; run distro_bootcmd;"
        '';
      };
    in
    [
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
    initrd.kernelModules = [
      "zstd"
      "btrfs"
    ];
  };

  fileSystems =
    let
      defaultOptions = [ "ssd_spread" ];
      device = "/dev/disk/by-label/NIXOS_SD";
      fsType = "btrfs";
    in
    {
      "/" = {
        inherit device fsType;
        options = [ "subvol=@" ] ++ defaultOptions;
      };
      "/boot" = {
        inherit device fsType;
        options = [ "subvol=@boot" ] ++ defaultOptions;
      };
      "/nix" = {
        inherit device fsType;
        options = [ "subvol=@nix" ] ++ defaultOptions;
      };
      "/var" = {
        inherit device fsType;
        options = [ "subvol=@var" ] ++ defaultOptions;
      };
      "/home" = {
        inherit device fsType;
        options = [ "subvol=@home" ] ++ defaultOptions;
      };
      "/.snapshots" = {
        inherit device fsType;
        options = [ "subvol=@snapshots" ] ++ defaultOptions;
      };
      "/boot/firmware" = {
        device = "/dev/disk/by-label/FIRMWARE";
        fsType = "vfat";
        options = [
          "nofail"
          "noauto"
        ];
      };
    };

  powerManagement.cpuFreqGovernor = lib.mkDefault "ondemand";
}
