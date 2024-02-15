{inputs'}:
inputs'.wezterm.packages.default.overrideAttrs (oldAttrs: {
  patches =
    (oldAttrs.patches or [])
    ++ [./optimized-build.patch];
})
