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
      default = "wezterm";
      type = types.str;
    };

    command = mkOption {
      default = "${cfg.name} start --class ${cfg.name} --always-new-process";
      type = types.str;
    };
  };

  config.home.sessionVariables.TERMINAL = "${config.terminal.name}";
}
