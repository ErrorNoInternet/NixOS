{
  config,
  lib,
  self,
  ...
}: let
  cfg = config.workstation.nvidia;
  inherit (lib) mkIf;
in {
  specialisation = mkIf cfg.enable {
    no-nvidia = self.lib.systems.mkSpecialisation "no-nvidia" {
      workstation.nvidia.enable = false;
    };

    no-nvidia-optimus = mkIf cfg.enableOptimus (self.lib.systems.mkSpecialisation "no-nvidia-optimus" {
      workstation.nvidia.enableOptimus = false;
    });
  };
}
