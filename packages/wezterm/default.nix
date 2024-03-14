{
  lib,
  system,
  wezterm,
  ...
}:
wezterm.overrideAttrs (oldAttrs: {
  patches =
    (oldAttrs.patches or [])
    ++ [./optimize-build.patch]
    ++ lib.optionals (system == "x86_64-linux")
    [./optimize-x86-64-build.patch];
})
