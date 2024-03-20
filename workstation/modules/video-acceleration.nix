{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.workstation.videoAcceleration;
  inherit (lib) mkEnableOption mkIf;
in {
  options.workstation.videoAcceleration.enable =
    mkEnableOption "" // {default = true;};

  config = mkIf cfg.enable {
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
