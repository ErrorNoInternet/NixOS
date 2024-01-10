{lib, ...}: let
  inherit (lib) mkEnableOption;
in {
  options.shared.flags = {
    raspberryPi = mkEnableOption "";
  };
}
