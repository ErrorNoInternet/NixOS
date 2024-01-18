{lib, ...}: {
  imports = [
    ./ErrorNoBinaries.nix
    ./hyprland.nix
    ./nix-community.nix
    ./nix-gaming.nix
  ];

  nix.settings = {
    substituters = lib.mkOrder 2000 ["https://cache.nixos.org/"];
    trusted-public-keys = ["cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="];
  };
}
