({
  config,
  lib,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
in {
  options.workstation.modules.nvidia.enable =
    mkEnableOption ""
    // {
      default = true;
    };

  config = mkIf (config.specialisation != {} && config.workstation.modules.nvidia.enable) {
    nixpkgs.config.cudaSupport = true;

    services.xserver.videoDrivers = ["nvidia"];
    hardware = {
      opengl = {
        enable = true;
        driSupport = true;
        driSupport32Bit = true;
      };

      nvidia = {
        package = config.boot.kernelPackages.nvidiaPackages.production;
        modesetting.enable = true;

        prime = {
          offload = {
            enable = true;
            enableOffloadCmd = true;
          };

          intelBusId = "PCI:0:2:0";
          nvidiaBusId = "PCI:1:0:0";
        };
      };
    };
  };
})
