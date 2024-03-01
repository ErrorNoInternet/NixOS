{
  config,
  lib,
  osConfig,
  self',
  ...
}: let
  cfg = config.desktops.hyprland;
  inherit (lib) mkEnableOption mkIf;
in {
  imports = [
    ./input.nix
    ./keybinds.nix
    ./options.nix
    ./programs.nix
    ./theme.nix
    ./windowrules.nix
  ];

  options.desktops.hyprland.enable =
    mkEnableOption ""
    // {
      default =
        if (osConfig ? workstation)
        then osConfig.workstation.desktops.hyprland.enable
        else false;
    };

  config = mkIf cfg.enable {
    caches.hyprland.enable = true;

    wayland.windowManager.hyprland = {
      enable = true;
      package = self'.packages.hyprland;
    };
  };
}
