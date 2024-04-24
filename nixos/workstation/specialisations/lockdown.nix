{
  config,
  lib,
  pkgs,
  self,
  ...
}: let
  inherit (lib) mkOverride;

  kernelPackages = pkgs.linuxPackages_hardened;
in {
  specialisation.lockdown = self.lib.nixos.mkSpecialisation "lockdown" {
    workstation.zfs = {inherit kernelPackages;};

    boot = {
      kernelPackages = mkOverride 1100 kernelPackages;

      blacklistedKernelModules = [
        "ufs"
      ];

      kernelParams = [
        "debugfs=off"
        "init_on_free=1"
        "page_alloc.shuffle=1"
        "slab_nomerge"
        "slub_debug=FZ"
      ];

      kernel.sysctl = {
        "kernel.sysrq" = 0;

        "net.ipv4.conf.all.rp_filter" = 1;
        "net.ipv4.conf.default.rp_filter" = 1;
      };
    };

    security = {
      apparmor.enable = true;
      lockKernelModules = true;
      protectKernelImage = true;
    };

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
