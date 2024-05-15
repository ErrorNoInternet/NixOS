{
  config,
  lib,
  ...
}: let
  inherit (lib) optionals versionAtLeast;
  kernelVersion = config.workstation.kernel.version;
in {
  boot.kernelPatches =
    [
      {
        name = "Rust support";
        patch = null;
        features.rust = true;
      }
    ]
    ++ optionals (versionAtLeast kernelVersion "6.6") [
      {
        name = "BTRFS allocator hints";
        patch = ./files/btrfs-allocator-hints.patch;
      }
    ];
}
