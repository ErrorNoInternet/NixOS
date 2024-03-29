{lib, ...}: {
  imports = [
    ./cuda.nix
    ./errornobinaries.nix
    ./garnix.nix
    ./nix-community.nix
    ./nix-on-droid.nix
  ];

  nix.settings.substituters = lib.mkOrder 2000 ["https://cache.nixos.org"];
}
