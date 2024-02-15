{inputs'}:
inputs'.wezterm.packages.default.overrideAttrs (oldAttrs: {
  patches =
    (oldAttrs.patches or [])
    ++ [./optimize-build.patch];
})
