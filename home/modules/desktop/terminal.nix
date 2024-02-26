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
      default = "foot";
      type = types.str;
    };

    command = mkOption {
      default = "${cfg.name}";
      type = types.str;
    };
  };

  config.home.sessionVariables.TERMINAL = config.terminal.name;
}
