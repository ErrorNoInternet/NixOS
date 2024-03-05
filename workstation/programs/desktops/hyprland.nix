{
  config,
  lib,
  self',
  ...
}:
let
  inherit (lib) mkEnableOption mkIf;
in
{
  options.workstation.desktops.hyprland.enable = mkEnableOption "";

  config = mkIf config.workstation.desktops.hyprland.enable {
    caches.hyprland.enable = true;

    programs.hyprland = {
      enable = true;
      package = self'.packages.hyprland;
    };
  };
}
