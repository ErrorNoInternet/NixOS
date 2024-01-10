{lib, ...}: let
  inherit (lib) mkEnableOption;
in {
  options.home.flags = {
    nixOnDroid = mkEnableOption "";
  };
}
