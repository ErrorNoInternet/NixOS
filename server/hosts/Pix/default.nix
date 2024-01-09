{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware.nix
    ./drives.nix

    ../../../shared/modules/raspberry-pi.nix
    ../../modules/attic-server.nix
    ../../modules/nfs.nix
    ../../modules/printing.nix
    ../../modules/samba.nix
    ../../programs/fish.nix
  ];
  age.secrets.ddns.file = ../../../secrets/ddns.age;

  networking.hostName = "Pix";
  environment.variables.HOSTNAME = "Pix";

  caches.ErrorNoBinaries.external = false;

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

  systemd = {
    timers."update-ddns" = {
      wantedBy = ["timers.target"];
      timerConfig = {
        OnBootSec = "1m";
        OnUnitActiveSec = "6h";
        Unit = "update-ddns.service";
      };
    };
    services."update-ddns" = {
      script = ''
        TOKEN="$(head -n1 ${config.age.secrets.ddns.path})"
        ZONES="$(tail -n+2 ${config.age.secrets.ddns.path})"
        for ZONE in $ZONES; do
          ${pkgs.curl}/bin/curl -4Lv "https://ipv4.dynv6.com/api/update?ipv4=auto&token=$TOKEN&zone=$ZONE"
        done
      '';
      serviceConfig = {
        Type = "oneshot";
        User = "root";
      };
    };
  };
}
