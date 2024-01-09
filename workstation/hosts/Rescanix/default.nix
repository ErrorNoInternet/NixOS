{
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./hardware.nix

    ../../../shared/modules/aarch64-emulation.nix
    ../../../shared/modules/btrfs-compression.nix
    ../../modules/bluetooth.nix
    ../../modules/nvidia-options.nix
    ../../modules/nvidia.nix
    ../../modules/video-acceleration.nix
    ../../modules/virtualization.nix
    ../../modules/zfs.nix
    ../../programs/clamav.nix
    ../../programs/fish.nix
    ../../programs/hyprland.nix
    ../../programs/openrgb.nix
  ];

  caches.hyprland.enable = true;

  profiles.vmGuest.enable = true;

  environment.variables.HOSTNAME = "Rescanix";
  networking = {
    hostName = "Rescanix";
    hostId = "3a1f6cc6";
  };

  boot = {
    loader = {
      timeout = lib.mkForce 5;
      systemd-boot = {
        memtest86.enable = true;
        netbootxyz.enable = true;
      };
    };
    kernelParams = [
      "boot.shell_on_fail"
    ];
    supportedFilesystems = ["exfat" "xfs"];
  };

  services.printing = {
    enable = true;
    drivers = with pkgs; [hplip];
  };
  services.xserver.desktopManager.plasma5.enable = true;
}
