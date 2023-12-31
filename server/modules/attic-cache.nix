{
  config,
  inputs,
  ...
}: let
  port = 7455;
  storage = "/mnt/drive1/Ryan/nix/attic";
in {
  imports = [inputs.attic.nixosModules.atticd];
  age.secrets.attic-server-token.file = ../../secrets/attic-server-token.age;

  networking.firewall.allowedTCPPorts = [port];
  services.atticd = {
    enable = true;
    credentialsFile = config.age.secrets.attic-server-token.path;
    settings = {
      listen = "[::]:${builtins.toString port}";
      database.url = "sqlite://${storage}/server.db";
      storage = {
        type = "local";
        path = "${storage}/storage";
      };
      compression = {
        type = "zstd";
        level = 3;
      };
      chunking.nar-size-threshold = 0;
      garbage-collection = {
        interval = "7 days";
        default-retention-period = "2 months";
      };
    };
  };
}
