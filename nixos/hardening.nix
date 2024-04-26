{
  boot = {
    kernel.sysctl = {
      "net.ipv4.conf.all.accept_redirects" = 0;
      "net.ipv4.conf.all.secure_redirects" = 0;
      "net.ipv4.conf.default.accept_redirects" = 0;
      "net.ipv4.conf.default.secure_redirects" = 0;
      "net.ipv6.conf.all.accept_redirects" = 0;
      "net.ipv6.conf.default.accept_redirects" = 0;

      "net.ipv4.tcp_fin_timeout" = 30;

      "vm.page-cluster" = 0;
      "vm.swappiness" = 180;
    };

    blacklistedKernelModules = [
      "ax25"
      "netrom"
      "rose"

      "adfs"
      "affs"
      "befs"
      "bfs"
      "cramfs"
      "efs"
      "exofs"
      "freevxfs"
      "jfs"
      "minix"
      "omfs"
      "qnx4"
      "qnx6"
      "sysv"
    ];
  };
}
