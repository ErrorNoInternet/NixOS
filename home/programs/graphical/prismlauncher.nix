{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.customPrograms.graphical.prismlauncher;
  inherit (lib) mkEnableOption mkIf;
in {
  options.customPrograms.graphical.prismlauncher.enable =
    mkEnableOption "";

  config = mkIf cfg.enable {
    home.packages = [pkgs.prismlauncher];
  };
}
