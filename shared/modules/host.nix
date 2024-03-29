{
  config,
  lib,
  ...
}: let
  cfg = config.host;
  inherit (lib) mkOption mkIf types;
in {
  options.host = {
    name = mkOption {
      type = types.str;
    };

    id = mkOption {
      type = with types; nullOr str;
      default = null;
    };

    system = mkOption {
      type = types.str;
    };

    architecture = mkOption {
      type = types.str;
      default = "x86-64-v3";
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
