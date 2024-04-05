{lib, ...}: let
  inherit (lib) mkOption types;
in {
  options.name = mkOption {
    type = types.str;
    default = "error";
  };
}
