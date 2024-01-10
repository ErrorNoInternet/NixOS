{
  config,
  lib,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
in {
  options.home.programs.graphical.obsStudio.enable = mkEnableOption "";

  config = mkIf config.home.programs.graphical.obsStudio.enable {
    programs.obs-studio.enable = true;
  };
}
