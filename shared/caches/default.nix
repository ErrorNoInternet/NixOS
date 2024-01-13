{
  config,
  lib,
  ...
}: let
  inherit (lib) mkOption mkIf types;
in {
  imports = [
    ./ErrorNoBinaries.nix
    ./hyprland.nix
    ./nix-community.nix
    ./nix-gaming.nix
  ];

  options.caches.isHome = mkOption {
    default = false;
    type = types.bool;
  };

  config.nix.settings = mkIf (!config.caches.isHome) {
    substituters = ["https://cache.nixos.org/"];
    trusted-public-keys = ["cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="];
  };
}
