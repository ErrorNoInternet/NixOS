{lib, ...}: let
  inherit (lib) mkEnableOption;
in {
  options.shared.flags = {
    isRaspberryPi = mkEnableOption "";
    isWorkstation = mkEnableOption "";
  };
}
