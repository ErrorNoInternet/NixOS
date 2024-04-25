{
  boot.kernelPatches = [
    {
      name = "BTRFS allocator hints";
      patch = ./files/btrfs-allocator-hints.patch;
    }
  ];
}
