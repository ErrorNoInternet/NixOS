{lib, ...}: let
  inherit (lib) mkOption types;
in {
  options.username = mkOption {
    type = types.str;
    default = "error";
  };
}
