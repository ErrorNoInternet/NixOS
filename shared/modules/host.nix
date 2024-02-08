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
      default = "";
      type = types.str;
    };

    system = mkOption {
      type = types.str;
    };
  };

  config = {
    nixpkgs.hostPlatform = cfg.system;
    environment.variables.HOSTNAME = "${cfg.name}";
    networking = {
      hostName = "${cfg.name}";
      hostId = mkIf (cfg.id != "") cfg.id;
    };
  };
}
