{
  inputs,
  pkgs,
  ...
}: let
  port = 7455;
in {
  networking.firewall.allowedTCPPorts = [port];
  environment.etc."attic-cache.toml".text = ''
    listen = "[::]:${builtins.toString port}"
    token-hs256-secret-base64 = "OGZqWFV1QnZQaHdCSm5RVGFtRlBCTWRSSHB0b0hkY3dTeG9YN0F0SFBpdzAwdklUMlpQcTRJSFFRMzROSEFaaUJSZXlHYTl2MjdLQzVIR2pRS0ZJSTlydWZlSE5kT1dsYzVFRUxXUnY3Zkc1VVVCWjlxSHVzOVZpM1IzbU16WHE="

    [database]
    url = "sqlite:///mnt/drive1/Ryan/nix/attic/server.db"

    [storage]
    type = "local"
    path = "/mnt/drive1/Ryan/nix/attic/storage"

    [chunking]
    nar-size-threshold = 0

    [compression]
    type = "zstd"
    level = 3

    [garbage-collection]
    interval = "7 days"
    default-retention-period = "3 months"
  '';
  systemd.services.attic-cache = {
    wantedBy = ["multi-user.target"];
    description = "Attic - a Nix binary cache";
    serviceConfig = {
      Type = "simple";
      Restart = "always";
      ExecStart = ''${inputs.attic.packages.${pkgs.system}.attic}/bin/atticd -f /etc/attic-cache.toml'';
    };
  };
}
