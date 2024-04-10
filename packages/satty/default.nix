{
  host,
  satty,
  self,
  ...
}:
self.lib.derivations.rust.optimizeAll host (satty.overrideAttrs (old: {
  patches = (old.patches or []) ++ [./remove-notifications.patch];
}))
