{lib, ...}: let
  inherit (lib) mkOption types;
in {
  options.font.name = mkOption {
    default = "JetBrainsMonoNL Nerd Font";
    type = types.str;
  };
}
