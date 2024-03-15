{btrfs-progs, ...}:
btrfs-progs.overrideAttrs (oldAttrs: {
  patches =
    (oldAttrs.patches or [])
    ++ [./receive-selinux.patch];
})
