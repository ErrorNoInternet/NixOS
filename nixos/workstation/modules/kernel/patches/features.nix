{
  boot.kernelPatches = [
    {
      name = "Rust support";
      patch = null;
      features.rust = true;
    }

    {
      name = "BTRFS allocator hints";
      patch = ./files/btrfs-allocator-hints.patch;
    }

    {
      name = "BTRFS default to ZSTD compression";
      patch = ./files/btrfs-default-zstd-compression.patch;
    }
  ];
}
