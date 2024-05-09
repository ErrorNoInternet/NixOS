{
  host,
  rsync,
  self,
  ...
}:
self.lib.derivations.c.optimizeAll host (rsync.overrideAttrs (old: {
  patches = (old.patches or []) ++ [./reflink.patch];
}))
