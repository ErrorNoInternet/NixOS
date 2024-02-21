{
  config,
  lib,
  self,
  ...
}: let
  cfg = config.workstation.modules.nvidia;
  inherit (lib) mkEnableOption mkIf;
in {
  options.workstation.modules.nvidia.enableSpecialisations =
    mkEnableOption ""
    // {
      default = cfg.enable;
    };

  config = mkIf cfg.enableSpecialisations {
    specialisation = with self.lib.systems; {
      no-nvidia = mkSpecialisation "no-nvidia" {
        hardware.nvidia.modesetting.enable = false;
        hardware.nvidia.prime.offload.enable = false;
      };

      no-nvidia-optimus = mkSpecialisation "no-nvidia-optimus" {
        nixpkgs.config = {
          allowUnfree = true;
          cudaSupport = true;
        };

        caches.cuda.enable = true;

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
