{
  config,
  lib,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
in {
  options.workstation.profiles.qemuGuest.enable = mkEnableOption "";

  config = mkIf config.workstation.profiles.qemuGuest.enable {
    boot.initrd.availableKernelModules = [
      "virtio_blk"
      "virtio_pci"
      "virtio_scsi"
    ];

    services.spice-vdagentd.enable = true;
  };
}
