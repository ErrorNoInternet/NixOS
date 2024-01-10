{
  config,
  lib,
  ...
}: let
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
  };

  config = {
    environment.variables.HOSTNAME = "${config.host.name}";
    networking = {
      hostName = "${config.host.name}";
      hostId = mkIf (config.host.id != "") config.host.id;
    };
  };
}
