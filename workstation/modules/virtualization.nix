{
  config,
  inputs,
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
        qemu.ovmf.packages = let
          pkgsArm = import inputs.nixpkgs {
            system = "aarch64-linux";
          };
        in [
          pkgs.OVMFFull.fd
          pkgsArm.OVMFFull.fd
        ];
      };
      spiceUSBRedirection.enable = true;
    };
    users.users.error.extraGroups = ["libvirtd"];
  };
}
