{
  alejandra,
  host,
  self,
  ...
}:
self.lib.derivations.rust.optimizeAll host
(alejandra.overrideAttrs (old: {
  patches =
    (old.patches or [])
    ++ [./remove-ads.patch];
}))
