{
  config,
  lib,
  ...
}: let
  cfg = config.workstation.nvidia;
  inherit (lib) mkEnableOption mkIf;
in {
  options.workstation.nvidia = {
    enable = mkEnableOption "" // {default = true;};
    enableOptimus = mkEnableOption "" // {default = true;};
  };

  config = mkIf cfg.enable {
    nixpkgs.config.cudaSupport = true;

    caches.numtide.enable = true;

    services.xserver.videoDrivers = ["nvidia"];

    hardware = {
      nvidia = {
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
