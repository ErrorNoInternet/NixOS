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
      default = "wezterm";
    };

    command = mkOption {
      type = types.str;
      default = "${cfg.name} start --class ${cfg.name} --always-new-process";
    };
  };

  config.home.sessionVariables.TERMINAL = cfg.name;
}
