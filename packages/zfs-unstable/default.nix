{zfs_unstable, ...}:
zfs_unstable.overrideAttrs (old: {
  patches = (old.patches or []) ++ [./chacha20poly1305.patch];
})
