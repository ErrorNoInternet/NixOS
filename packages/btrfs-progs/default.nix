{btrfs-progs, ...}:
btrfs-progs.overrideAttrs (old: {
  patches =
    (old.patches or [])
    ++ [./receive-selinux.patch];
})
