{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
in {
  imports = [
    ./autoname-workspaces.nix
    ./execs.nix
    ./keybinds.nix
    ./options.nix
    ./visual.nix
    ./windowrules.nix
  ];

  options.desktop.hyprland.enable = mkEnableOption "";

  config = mkIf config.desktop.hyprland.enable {
    caches.hyprland.enable = true;

    wayland.windowManager.hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    };
  };
}
