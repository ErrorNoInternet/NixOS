{lib, ...}: let
  inherit (lib) mkEnableOption;
in {
  options.flags = {
    isNixOnDroid = mkEnableOption "";
    isWorkstation = mkEnableOption "";
  };
}
