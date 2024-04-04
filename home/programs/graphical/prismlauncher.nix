{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.customPrograms.prismlauncher;
  inherit (lib) mkEnableOption mkIf;
in {
  options.customPrograms.prismlauncher.enable =
    mkEnableOption "";

  config = mkIf cfg.enable {
    home.packages = [pkgs.prismlauncher];
  };
}
