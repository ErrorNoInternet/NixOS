{
  systems = ["aarch64-linux" "x86_64-linux"];
  perSystem = {
    inputs',
    pkgs,
    ...
  }: {
    packages = with pkgs; {
      btrfs-progs = callPackage ./btrfs-progs {};
      nix = callPackage ./nix.nix {inherit inputs';};
    };
  };
}
