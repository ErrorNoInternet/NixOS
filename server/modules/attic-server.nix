{
  config,
  inputs,
  ...
}: let
  host = "errornointernet.dynv6.net";
  insecurePort = 7454;
  securePort = 7455;
  storagePath = "/mnt/drive1/Ryan/nix/attic/";
in {
  imports = [inputs.attic.nixosModules.atticd];
  age.secrets.attic-server-token.file = ../../secrets/attic-server-token.age;

  networking.firewall.allowedTCPPorts = [insecurePort securePort];
  systemd.services.atticd.serviceConfig.ReadWritePaths = "${storagePath}";

  services = {
    atticd = {
      enable = true;
      credentialsFile = config.age.secrets.attic-server-token.path;
      settings = {
        listen = "[::]:${builtins.toString insecurePort}";
        api-endpoint = "https://${host}:${builtins.toString securePort}/";

        database.url = "sqlite://${storagePath}/server.db";
        storage = {
          type = "local";
          path = "${storagePath}/storage";
        };
        compression = {
          type = "zstd";
          level = 3;
        };
        chunking = {
          nar-size-threshold = 0;
          min-size = 16 * 1024;
          avg-size = 64 * 1024;
          max-size = 256 * 1024;
        };
        garbage-collection = {
          interval = "7 days";
          default-retention-period = "3 months";
        };
      };
    };

    nginx = {
      enable = true;
      recommendedProxySettings = true;
      recommendedTlsSettings = true;
      virtualHosts."${host}" = {
        forceSSL = true;
        sslCertificate = "/etc/letsencrypt/live/${host}/fullchain.pem";
        sslCertificateKey = "/etc/letsencrypt/live/${host}/privkey.pem";
        listen = [
          {
            addr = "0.0.0.0";
            port = securePort;
            ssl = true;
          }
        ];
        locations."/" = {
          proxyPass = "http://localhost:${builtins.toString insecurePort}";
          extraConfig = ''
            proxy_pass_header Authorization;
          '';
        };
      };
    };
  };
}
