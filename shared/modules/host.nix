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
      default = null;
      type = with types; nullOr str;
    };
  };

  config = {
    nixpkgs.hostPlatform = cfg.system;
    environment.variables.HOSTNAME = cfg.name;
    networking = {
      hostName = cfg.name;
      hostId = mkIf (cfg.id != null) cfg.id;
    };
  };
}
