{
  config,
  lib,
  self,
  ...
}: let
  cfg = config.workstation.modules.nvidia;
in {
  specialisation = lib.mkIf cfg.enable {
    no-nvidia = self.lib.systems.mkSpecialisation "no-nvidia" {
      workstation.modules.nvidia.enable = false;
    };
  };
}
