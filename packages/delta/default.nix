{
  delta,
  host,
  self,
  ...
}:
self.lib.derivations.rust.optimizeAll host (delta.overrideAttrs (old: {
  patches = (old.patches or []) ++ [./reproducible.patch];
}))
