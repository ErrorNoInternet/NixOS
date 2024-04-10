{
  config,
  system,
  ...
}: let
  cfg = config.host;
in {
  networking = {
    hostName = cfg.name;
    hostId = cfg.id;
  };

  environment.variables.HOSTNAME = cfg.name;

  nixpkgs.hostPlatform = system;
}
