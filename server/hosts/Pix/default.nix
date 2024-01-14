{
  imports = [
    ./ddns.nix
    ./drives.nix
  ];

  shared = {
    flags.raspberryPi = true;
    modules.emulation.linux.aarch64 = false;
  };

  server.modules = {
    servers = {
      attic.enable = true;
      nfs.enable = true;
      samba.enable = true;
    };
    printing.enable = true;
  };

  networking.firewall = {
    allowedTCPPorts = [
      # services
      1010
      1011
      1012
      1015
      22122

      # testing
      8080
      8081
      8082
      8083
      8084

      # backups
      56450
      56451
    ];
    allowedUDPPorts = [
      # services
      1010
      1011
      1012

      # testing
      8080
      8081
      8082
      8083
      8084
    ];
  };
}
