{
  imports = [
    ./ddns.nix
    ./drives.nix
  ];

  host.architecture = "cortex-a72";

  nixos = {
    flags.isRaspberryPi = true;
    btrfs.compression.enable = true;
  };

  server = {
    services = {
      atticd.enable = true;
      nfs.enable = true;
      samba.enable = true;
    };
    printing.enable = true;
  };

  programs.ssh.forwardX11 = true;

  networking.firewall = {
    allowedTCPPorts = [
      1010
      1011
      1012
      1015
      22122

      8080
      8081
      8082
      8083
      8084

      56450
      56451
    ];
    allowedUDPPorts = [
      1010
      1011
      1012

      8080
      8081
      8082
      8083
      8084
    ];
  };
}
