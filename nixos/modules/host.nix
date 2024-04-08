{
  config,
  lib,
  ...
}: let
  cfg = config.host;
  inherit (lib) mkIf;
in {
  networking = {
    hostName = cfg.name;
    hostId = mkIf (cfg.id != null) cfg.id;
  };

  environment.variables.HOSTNAME = cfg.name;

  nixpkgs.hostPlatform = cfg.system;
}
