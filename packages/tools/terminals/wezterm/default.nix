{
  inputs',
  lib,
  system,
}:
inputs'.wezterm.packages.default.overrideAttrs (oldAttrs: {
  patches =
    (oldAttrs.patches or [])
    ++ [./optimize-build.patch]
    ++ lib.optionals (system == "x86_64-linux")
    [./optimize-x86-64-build.patch];
})
