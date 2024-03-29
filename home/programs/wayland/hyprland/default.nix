{
  config,
  lib,
  osConfig,
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
    ./visual.nix
    ./windowrules.nix
  ];

  options.desktops.hyprland.enable =
    mkEnableOption "" // {default = osConfig.workstation.desktops.hyprland.enable or false;};

  config = mkIf cfg.enable {
    wayland.windowManager.hyprland = {
      enable = true;
      package = config.pkgsSelf.hyprland;
    };
  };
}
