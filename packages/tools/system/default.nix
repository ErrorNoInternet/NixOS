{
  perSystem =
    { inputs', pkgs, ... }:
    {
      packages = with pkgs; {
        btrfs-map-physical = callPackage ./btrfs-map-physical.nix { };
        btrfs-progs = callPackage ./btrfs-progs { };
        nix = callPackage ./nix.nix { inherit inputs'; };
      };
    };
}
