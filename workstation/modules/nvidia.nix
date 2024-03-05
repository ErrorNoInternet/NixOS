{ config, lib, ... }:
let
  cfg = config.workstation.modules.nvidia;
  inherit (lib) mkEnableOption mkIf;
in
{
  options.workstation.modules.nvidia = {
    enable = mkEnableOption "" // {
      default = true;
    };
    enableOptimus = mkEnableOption "" // {
      default = true;
    };
  };

  config = mkIf cfg.enable {
    caches.cuda.enable = true;

    services.xserver.videoDrivers = [ "nvidia" ];
    hardware = {
      nvidia = {
        package = config.boot.kernelPackages.nvidiaPackages.production;
        modesetting.enable = true;

        prime = mkIf cfg.enableOptimus {
          offload = {
            enable = true;
            enableOffloadCmd = true;
          };

          intelBusId = "PCI:0:2:0";
          nvidiaBusId = "PCI:1:0:0";
        };
      };

      opengl = {
        enable = true;
        driSupport = true;
        driSupport32Bit = true;
      };
    };
  };
}
