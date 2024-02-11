{
  config,
  lib,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
in {
  options.workstation.modules.nvidia.enableSpecialisations =
    mkEnableOption ""
    // {
      default = config.workstation.modules.nvidia.enable;
    };

  config = mkIf config.workstation.modules.nvidia.enableSpecialisations {
    specialisation = {
      no-nvidia.configuration = {
        hardware.nvidia.modesetting.enable = false;
        hardware.nvidia.prime.offload.enable = false;
      };

      no-nvidia-prime.configuration = {
        caches.cuda.enable = true;

        nixpkgs.config.cudaSupport = true;

        services.xserver.videoDrivers = ["nvidia"];
        hardware = {
          opengl = {
            enable = true;
            driSupport = true;
            driSupport32Bit = true;
          };
          nvidia = {
            modesetting.enable = true;
            prime.offload.enable = false;
          };
        };
      };
    };
  };
}
