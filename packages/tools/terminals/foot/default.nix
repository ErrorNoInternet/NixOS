{foot}:
foot.overrideAttrs (oldAttrs: {
  patches =
    (oldAttrs.patches or [])
    ++ [./fix-font-misalignment.patch];
})
