{
  config,
  lib,
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
      libvirtd.enable = true;
      spiceUSBRedirection.enable = true;
    };
    users.users.ryan.extraGroups = ["libvirtd"];
  };
}
