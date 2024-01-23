{
  config,
  lib,
  ...
}: {
  options.terminal.name = lib.mkOption {
    default = "kitty";
    type = lib.types.str;
  };

  config.home.sessionVariables.TERMINAL = "${config.terminal.name}";
}
