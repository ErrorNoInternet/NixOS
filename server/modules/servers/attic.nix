{
  config,
  inputs,
  lib,
  ...
}: let
  inherit (lib) mkEnableOption mkOption mkIf types;
in {
  imports = [inputs.attic.nixosModules.atticd];

  options.server.modules.servers.attic = {
    enable = mkEnableOption "";

    host = mkOption {
      default = "errornointernet.dynv6.net";
      type = types.str;
    };

    ports = {
      insecure = mkOption {
        default = 7454;
        type = types.numbers.between 0 65535;
      };

      secure = mkOption {
        default = 7455;
        type = types.numbers.between 0 65535;
      };
    };

    storagePath = mkOption {
      default = "/mnt/drive1/Ryan/nix/attic/";
      type = types.str;
    };
  };

  config = with config.server.modules.servers.attic;
    mkIf config.server.modules.servers.attic.enable {
      age.secrets.attic-server-token.file = ../../../secrets/attic-server-token.age;
      networking.firewall.allowedTCPPorts = [ports.insecure ports.secure];
      systemd.services.atticd.serviceConfig.ReadWritePaths = ["${storagePath}"];
      services = {
        atticd = {
          enable = true;
          credentialsFile = config.age.secrets.attic-server-token.path;
          settings = {
            listen = "[::]:${builtins.toString ports.insecure}";
            api-endpoint = "https://${host}:${builtins.toString ports.secure}/";

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
              min-size = 64 * 1024;
              avg-size = 128 * 1024;
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
          clientMaxBodySize = "10G";
          virtualHosts."${host}" = {
            forceSSL = true;
            sslCertificate = "/etc/letsencrypt/live/${host}/fullchain.pem";
            sslCertificateKey = "/etc/letsencrypt/live/${host}/privkey.pem";
            listen = [
              {
                addr = "0.0.0.0";
                port = ports.secure;
                ssl = true;
              }
            ];
            locations."/" = {
              proxyPass = "http://localhost:${builtins.toString ports.insecure}";
              extraConfig = ''
                proxy_pass_header Authorization;
              '';
            };
          };
        };
      };
    };
}
