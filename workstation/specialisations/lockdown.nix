{self, ...}: {
  specialisation.lockdown = self.lib.systems.mkSpecialisation "lockdown" {
    boot.loader.kernel.sysctl = {
      "kernel.sysrq" = 0;
    };
    networking.firewall = {
      enable = true;
      allowPing = false;
    };
    services.openssh.enable = false;
  };
}
