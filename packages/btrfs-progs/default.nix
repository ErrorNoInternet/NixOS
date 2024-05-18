{btrfs-progs, ...}:
btrfs-progs.overrideAttrs (old: {
  patches =
    (old.patches or [])
    ++ [
      ./dump-csum.patch
      ./receive-selinux.patch
    ];
})
