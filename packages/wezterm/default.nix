{
  host,
  self,
  wezterm,
  ...
}:
self.lib.derivations.rust.optimizeAll host
(wezterm.overrideAttrs (old: {
  patches =
    (old.patches or [])
    ++ [
      ./remove-first-configure.patch
      ./remove-set-cursor.patch
    ];
}))
