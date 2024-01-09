{lib, ...}: {
  options.terminal.name = lib.mkOption {
    default = "foot";
    type = lib.types.str;
  };
}
