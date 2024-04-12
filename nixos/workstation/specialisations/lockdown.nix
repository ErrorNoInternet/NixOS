{
  config,
  pkgs,
  self,
  ...
}: let
  kernelPackages = pkgs.linuxPackages_hardened;
in {
  specialisation.lockdown = self.lib.nixos.mkSpecialisation "lockdown" {
    workstation.zfs.kernelPackages = kernelPackages;

    boot = {
      kernelPackages = kernelPackages;

      kernel.sysctl = {
        "kernel.kexec_load_disabled" = 1;
        "kernel.sysrq" = 0;

        "net.ipv4.conf.all.rp_filter" = 1;
        "net.ipv4.conf.default.rp_filter" = 1;
      };
    };

    security.lockKernelModules = true;

    services = {
      logind.lidSwitch = "suspend";

      openssh = {
        ports = [65535];
        openFirewall = false;
      };
      rpcbind.enable = false;
    };

    networking.firewall = {
      enable = true;
      allowPing = false;
    };

    workstation.bluetooth.enable = false;

    home-manager.users.${config.username} = {
      services.kdeconnect.enable = false;
    };
  };
}
