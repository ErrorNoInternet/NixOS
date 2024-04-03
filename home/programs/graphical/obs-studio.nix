{
  config,
  lib,
  ...
}: let
  cfg = config.customPrograms.graphical.obsStudio;
  inherit (lib) mkEnableOption mkIf;
in {
  options.customPrograms.graphical.obsStudio.enable = mkEnableOption "";

  config = mkIf cfg.enable {
    programs.obs-studio.enable = true;
  };
}
