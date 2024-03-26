{
  config,
  lib,
  ...
}: let
  cfg = config.host;
  inherit (lib) mkOption mkIf types;
in {
  options.host = {
    system = mkOption {
      type = types.str;
    };

    name = mkOption {
      type = types.str;
    };

    id = mkOption {
      type = with types; nullOr str;
      default = null;
    };
  };

  config = {
    networking = {
      hostName = cfg.name;
      hostId = mkIf (cfg.id != null) cfg.id;
    };

    environment.variables.HOSTNAME = cfg.name;

    nixpkgs.hostPlatform = cfg.system;
  };
}
