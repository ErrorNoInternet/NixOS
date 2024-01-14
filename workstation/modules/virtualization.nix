{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
in {
  options.workstation.modules.virtualization.enable =
    mkEnableOption ""
    // {
      default = true;
    };

  config = mkIf config.workstation.modules.virtualization.enable {
    virtualisation = {
      libvirtd = {
        enable = true;
        qemu.ovmf.packages = with pkgs; [
          OVMFFull.fd
          pkgsCross.aarch64-multiplatform.OVMF.fd
        ];
      };
      spiceUSBRedirection.enable = true;
    };
    users.users.error.extraGroups = ["libvirtd"];
  };
}
