{self, ...}: {
  specialisation.lockdown = self.lib.systems.mkSpecialisation "lockdown" {
    boot.kernel.sysctl = {
      "kernel.sysrq" = 0;
    };

    hardware.bluetooth.enable = false;

    networking.firewall = {
      enable = true;
      allowPing = false;
    };

    security.lockKernelModules = true;

    services.openssh.enable = false;
  };
}
