{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
in {
  options.workstation.videoAcceleration.enable =
    mkEnableOption ""
    // {
      default = true;
    };

  config = mkIf config.workstation.videoAcceleration.enable {
    hardware.opengl = {
      enable = true;
      extraPackages = with pkgs; [
        intel-vaapi-driver
        libvdpau-va-gl
        vaapiIntel
        vaapiVdpau
      ];
    };
    environment.sessionVariables = {
      LIBVA_DRIVER_NAME = "i965";
    };
  };
}
