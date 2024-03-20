{
  imports = [
    ./ddns.nix
    ./drives.nix
  ];
  host.id = "fc7ad223";

  shared = {
    flags.raspberryPi = true;
    modules.btrfs.compression.enable = true;
  };

  server = {
    services = {
      attic.enable = true;
      nfs.enable = true;
      samba.enable = true;
    };
    printing.enable = true;
    zfs.enable = true;
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
