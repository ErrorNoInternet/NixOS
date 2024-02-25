{lib, ...}: let
  inherit (lib) mkOption types;
in {
  options.font.name = mkOption {
    default = "JetBrainsMono Nerd Font";
    type = types.str;
  };
}
