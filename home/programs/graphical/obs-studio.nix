{
  config,
  lib,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
in {
  options.customPrograms.graphical.obsStudio.enable = mkEnableOption "";

  config = mkIf config.customPrograms.graphical.obsStudio.enable {
    programs.obs-studio.enable = true;
  };
}
