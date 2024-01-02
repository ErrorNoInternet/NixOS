{
  config,
  inputs,
  ...
}: let
  port = 7455;
  storagePath = "/mnt/drive1/Ryan/nix/attic";
in {
  imports = [inputs.attic.nixosModules.atticd];
  age.secrets.attic-server-token.file = ../../secrets/attic-server-token.age;

  networking.firewall.allowedTCPPorts = [port];
  systemd.services.atticd.serviceConfig.ReadWritePaths = "${storagePath}";
  services.atticd = {
    enable = true;
    credentialsFile = config.age.secrets.attic-server-token.path;
    settings = {
      listen = "[::]:${builtins.toString port}";
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
}
