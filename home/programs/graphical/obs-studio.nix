{
  config,
  lib,
  ...
}: let
  cfg = config.customPrograms.obsStudio;
  inherit (lib) mkEnableOption mkIf;
in {
  options.customPrograms.obsStudio.enable = mkEnableOption "";

  config = mkIf cfg.enable {
    programs.obs-studio.enable = true;
  };
}
