{
  imports = [
    ./common.nix
    ./unused.nix
  ];

  boot.kernelPatches = [
    {
      name = "BTRFS allocator hints";
      patch = ./files/btrfs-allocator-hints.patch;
    }
  ];
}
