{
  config,
  lib,
  ...
}: let
  cfg = config.workstation.desktops.hyprland;
  inherit (lib) mkEnableOption mkIf;
in {
  options.workstation.desktops.hyprland.enable = mkEnableOption "";

  config = mkIf cfg.enable {
    programs.hyprland.enable = true;
  };
}
