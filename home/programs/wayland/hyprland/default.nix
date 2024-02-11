{
  config,
  inputs',
  lib,
  osConfig,
  ...
}: let
  cfg = config.home.desktops.hyprland;
  inherit (lib) mkEnableOption mkIf;
in {
  imports = [
    ./autoname-workspaces.nix
    ./execs.nix
    ./input.nix
    ./keybinds.nix
    ./options.nix
    ./theme.nix
    ./windowrules.nix
  ];

  options.home.desktops.hyprland.enable =
    mkEnableOption ""
    // {
      default =
        if (builtins.hasAttr "workstation" osConfig)
        then osConfig.workstation.desktops.hyprland.enable
        else false;
    };

  config = mkIf cfg.enable {
    caches.hyprland.enable = true;

    wayland.windowManager.hyprland = {
      enable = true;
      package = inputs'.hyprland.packages.hyprland;
    };
  };
}
