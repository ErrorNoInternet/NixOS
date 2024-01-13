{
  config,
  lib,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
in {
  options.workstation.modules.nvidia.enableSpecializations =
    mkEnableOption ""
    // {
      default = config.workstation.modules.nvidia.enable;
    };

  config = mkIf config.workstation.modules.nvidia.enableSpecializations {
    specialisation = {
      no-nvidia.configuration = {
        hardware.nvidia.modesetting.enable = false;
        hardware.nvidia.prime.offload.enable = false;
      };

      no-nvidia-prime.configuration = {
        hardware.opengl = {
          enable = true;
          driSupport = true;
          driSupport32Bit = true;
        };
        services.xserver.videoDrivers = ["nvidia"];
        hardware.nvidia = {
          modesetting.enable = true;
          prime.offload.enable = false;
        };
      };
    };
  };
}
