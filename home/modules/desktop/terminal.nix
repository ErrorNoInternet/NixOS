{
  config,
  lib,
  ...
}: let
  cfg = config.terminal;
  inherit (lib) mkOption types;
in {
  options.terminal = {
    name = mkOption {
      type = types.str;
      default = "foot";
    };

    command = mkOption {
      type = types.str;
      default = "${cfg.name}";
    };
  };

  config.home.sessionVariables.TERMINAL = cfg.name;
}
