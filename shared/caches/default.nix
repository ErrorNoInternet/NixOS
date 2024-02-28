{lib, ...}: {
  imports = [
    ./cuda.nix
    ./errornobinaries.nix
    ./garnix.nix
    ./hyprland.nix
    ./nix-community.nix
    ./nix-gaming.nix
    ./yazi.nix
  ];

  nix.settings.substituters = lib.mkOrder 2000 ["https://cache.nixos.org"];
}
