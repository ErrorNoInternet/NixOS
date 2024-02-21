{self, ...}: {
  specialisation.lockdown = self.lib.systems.mkSpecialisation "lockdown" {
    boot.loader.kernel.sysctl = {
      "kernel.sysrq" = 0;
      "net.ipv4.icmp_echo_ignore_all" = 1;
      "net.ipv6.icmp.echo_ignore_all" = 1;
    };
    networking.firewall.enable = true;
    services.openssh.enable = false;
  };
}
