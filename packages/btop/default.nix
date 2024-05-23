{
  btop,
  host,
  self,
  ...
}:
self.lib.derivations.c.optimizeArchitecture host (btop.overrideAttrs (old: {
  patches = (old.patches or []) ++ [./fix-resize-warning.patch];
}))
