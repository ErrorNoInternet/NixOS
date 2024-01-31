{lib, ...}: {
  options.font.name = lib.mkOption {
    default = "JetBrainsMono Nerd Font Mono";
    type = lib.types.str;
  };
}
