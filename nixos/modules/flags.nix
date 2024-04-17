{lib, ...}: let
  inherit (lib) mkEnableOption;
in {
  options.nixos.flags = {
    isRaspberryPi = mkEnableOption "";
  };
}
