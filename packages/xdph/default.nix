{inputs', ...}:
inputs'.xdph.packages.default.overrideAttrs (old: {
  patches = (old.patches or []) ++ [./move-checkbox.patch];
})
