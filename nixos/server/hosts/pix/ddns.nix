{
  config,
  pkgs,
  self,
  ...
}: {
  age.secrets.ddns.file = "${self}/secrets/ddns.age";
  systemd = {
    timers.update-ddns = {
      wantedBy = ["timers.target"];
      timerConfig = {
        OnBootSec = "1m";
        OnUnitActiveSec = "6h";
        Unit = "update-ddns.service";
      };
    };
    services.update-ddns = {
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
