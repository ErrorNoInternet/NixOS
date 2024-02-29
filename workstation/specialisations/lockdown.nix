{self, ...}: {
  specialisation.lockdown = self.lib.systems.mkSpecialisation "lockdown" {
    boot.kernel.sysctl = {
      "kernel.kexec_load_disabled" = 1;
      "kernel.sysrq" = 0;

      "net.ipv4.conf.all.rp_filter" = 1;
      "net.ipv4.conf.default.rp_filter" = 1;
    };

    security.lockKernelModules = true;

    services.logind.lidSwitch = "suspend";

    networking.firewall = {
      enable = true;
      allowPing = false;
    };

    workstation.modules.bluetooth.enable = false;
  };
}
