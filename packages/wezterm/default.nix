{
  architectures,
  system,
  wezterm,
  self,
  ...
}:
self.lib.derivations.rust.optimizeAll
{inherit architectures system;}
(wezterm.overrideAttrs (old: {
  patches =
    (old.patches or [])
    ++ [
      ./remove-first-configure.patch
      ./remove-set-cursor.patch
    ];
}))
