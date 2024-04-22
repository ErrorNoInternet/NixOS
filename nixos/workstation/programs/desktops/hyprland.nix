{
  config,
  inputs,
  lib,
  ...
}: let
  cfg = config.workstation.desktops.hyprland;
  inherit (lib) mkEnableOption mkIf;
in {
  imports = [inputs.hyprland.nixosModules.default];

  options.workstation.desktops.hyprland.enable = mkEnableOption "";

  config = mkIf cfg.enable {
    programs.hyprland.enable = true;
  };
}
