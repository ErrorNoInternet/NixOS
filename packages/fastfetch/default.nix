{
  fastfetch,
  host,
  self,
  ...
}:
self.lib.derivations.c.optimizeAllExceptLto host
(fastfetch.overrideAttrs (old: {
  patches = (old.patches or []) ++ [./zfs-arc.patch];
}))
