{ config, lib, ... }:
let
  cfg = config.caches.hyprland;
  inherit (lib) mkEnableOption mkIf;
in
{
  options.caches.hyprland.enable = mkEnableOption "";

  config = mkIf cfg.enable {
    nix.settings = {
      substituters = [ "https://hyprland.cachix.org" ];
      trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
    };
  };
}
