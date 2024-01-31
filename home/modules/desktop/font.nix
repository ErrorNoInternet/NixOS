{lib, ...}: {
  options.font.name = lib.mkOption {
    default = "JetBrainsMono Nerd Font";
    type = lib.types.str;
  };
}
