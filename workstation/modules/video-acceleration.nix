{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
in {
  options.workstation.modules.videoAcceleration.enable =
    mkEnableOption ""
    // {
      default = true;
    };

  config = mkIf config.workstation.modules.videoAcceleration.enable {
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
