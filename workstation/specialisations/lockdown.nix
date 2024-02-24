{self, ...}: {
  specialisation.lockdown = self.lib.systems.mkSpecialisation "lockdown" {
    boot.kernel.sysctl = {
      "kernel.sysrq" = 0;
    };

    networking.firewall = {
      enable = true;
      allowPing = false;
    };

    security.lockKernelModules = true;

    workstation.modules.bluetooth.enable = false;
  };
}
