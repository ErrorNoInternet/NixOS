{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.workstation.virtualization;
  inherit (lib) mkEnableOption mkIf;
in {
  options.workstation.virtualization.enable =
    mkEnableOption "" // {default = true;};

  config = mkIf cfg.enable {
    users.users.error.extraGroups = ["libvirtd"];

    virtualisation = {
      libvirtd = {
        enable = true;
        qemu.ovmf.packages = [pkgs.OVMFFull.fd];
      };

      spiceUSBRedirection.enable = true;
    };

    shared.impermanence.directories = ["/var/lib/libvirt"];
  };
}
