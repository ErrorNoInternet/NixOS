{btrfs-progs, ...}:
btrfs-progs.overrideAttrs (old: {
  patches =
    (old.patches or [])
    ++ [
      ./dump-csum.patch
      ./remove-receive-errors.patch
    ];

  configureFlags =
    (old.configureFlags or [])
    ++ [
      "--enable-experimental"
    ];
})
