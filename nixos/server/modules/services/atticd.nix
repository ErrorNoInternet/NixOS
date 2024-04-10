{
  config,
  inputs,
  lib,
  self,
  ...
}: let
  cfg = config.server.services.atticd;
  inherit (lib) mkEnableOption mkOption mkIf types;
in {
  imports = [inputs.attic.nixosModules.atticd];

  options.server.services.atticd = {
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

  config = mkIf cfg.enable {
    age.secrets.attic-server-token.file = "${self}/secrets/attic_server-token.age";

    networking.firewall.allowedTCPPorts = with cfg.ports; [insecure secure];

    systemd.services.atticd.serviceConfig.ReadWritePaths = [cfg.storagePath];

    services = {
      atticd = {
        enable = true;
        credentialsFile = config.age.secrets.attic-server-token.path;

        settings = {
          listen = "[::]:${builtins.toString cfg.ports.insecure}";
          api-endpoint = "https://${cfg.host}:${builtins.toString cfg.ports.secure}/";

          database.url = "sqlite://${cfg.storagePath}/server.db";
          storage = {
            type = "local";
            path = "${cfg.storagePath}/storage";
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

        clientMaxBodySize = "10G";
        proxyTimeout = "120s";
        recommendedProxySettings = true;
        recommendedTlsSettings = true;

        virtualHosts.${cfg.host} = {
          forceSSL = true;
          sslCertificate = "/etc/letsencrypt/live/${cfg.host}/fullchain.pem";
          sslCertificateKey = "/etc/letsencrypt/live/${cfg.host}/privkey.pem";

          listen = [
            {
              addr = "0.0.0.0";
              port = cfg.ports.secure;
              ssl = true;
            }
          ];

          locations."/" = {
            proxyPass = "http://localhost:${builtins.toString cfg.ports.insecure}";
            extraConfig = ''
              proxy_pass_header Authorization;
            '';
          };
        };
      };
    };
  };
}
