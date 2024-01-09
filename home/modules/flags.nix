{lib, ...}: let
  inherit (lib) mkEnableOption;
in {
  options.flags = {
    nixOnDroid = mkEnableOption "";
  };
}
