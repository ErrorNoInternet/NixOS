{
  config,
  lib,
  self,
  ...
}: let
  cfg = config.workstation.modules.nvidia;
  inherit (lib) mkIf;
in {
  specialisation = mkIf cfg.enable {
    no-nvidia = self.lib.systems.mkSpecialisation "no-nvidia" {
      workstation.modules.nvidia.enable = false;
    };

    no-nvidia-optimus = mkIf cfg.enableOptimus (self.lib.systems.mkSpecialisation "no-nvidia-optimus" {
      workstation.modules.nvidia.enableOptimus = false;
    });
  };
}
