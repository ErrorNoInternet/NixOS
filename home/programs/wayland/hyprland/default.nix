{
  inputs,
  lib,
  osConfig,
  pkgs,
  ...
}: {
  imports = [
    ./autoname-workspaces.nix
    ./execs.nix
    ./input.nix
    ./keybinds.nix
    ./options.nix
    ./visual.nix
    ./windowrules.nix
  ];

  config = lib.mkIf (builtins.hasAttr "workstation" osConfig) (
    lib.mkIf osConfig.workstation.desktops.hyprland.enable {
      caches.hyprland.enable = true;

      wayland.windowManager.hyprland = {
        enable = true;
        package = inputs.hyprland.packages.${pkgs.system}.hyprland;
      };
    }
  );
}
