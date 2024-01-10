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
    systemd.services.libvirtd = {
      restartIfChanged = false;
      serviceConfig = {
        Type = "notify";
        KillMode = "process";
        Restart = "no";
      };
    };
    virtualisation = {
      libvirtd.enable = true;
      spiceUSBRedirection.enable = true;
    };
    users.users.ryan.extraGroups = ["libvirtd"];
  };
}
