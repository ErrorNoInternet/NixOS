{zfs_unstable, ...}:
zfs_unstable.overrideAttrs (old: {
  patches = (old.patches or []) ++ (import ./patches.nix);
})
