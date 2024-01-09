{
  config,
  lib,
  ...
}: {
  options.terminal.name = lib.mkOption {
    default = "foot";
    type = lib.types.str;
  };

  config.home.sessionVariables.TERMINAL = "${config.terminal.name}";
}
