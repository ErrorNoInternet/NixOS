{lib, ...}: {
  imports = [
    ./errornobinaries.nix
    ./garnix.nix
    ./nix-community.nix
    ./nix-on-droid.nix
    ./numtide.nix
  ];

  nix.settings.substituters = lib.mkOrder 2000 ["https://cache.nixos.org"];
}
