{
  config,
  lib,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
in {
  options.workstation.profiles.vmGuest.enable = mkEnableOption "";

  config = mkIf config.workstation.profiles.vmGuest.enable {
    boot.initrd.availableKernelModules = [
      "virtio_blk"
      "virtio_pci"
      "virtio_scsi"
    ];

    services.spice-vdagentd.enable = true;
  };
}
