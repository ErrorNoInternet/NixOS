{
  config,
  lib,
  pkgs,
  self,
  ...
}: let
  inherit (lib) mkOverride attrsets;

  kernelPackages = pkgs.linuxPackages_hardened;
in {
  specialisation.lockdown = self.lib.nixos.mkSpecialisation "lockdown" {
    workstation = {
      zfs = {inherit kernelPackages;};
      kernel.packages = mkOverride 1100 kernelPackages;
    };

    boot = {
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

      kernel.sysctl =
        {
          "kernel.ftrace_enabled" = 0;
          "kernel.sysrq" = 0;
        }
        // attrsets.optionalAttrs (!config.services.mullvad-vpn.enable) {
          "net.ipv4.conf.all.rp_filter" = 1;
          "net.ipv4.conf.default.rp_filter" = 1;
        };
    };

    security = {
      apparmor = {
        enable = true;
        killUnconfinedConfinables = true;
      };
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
