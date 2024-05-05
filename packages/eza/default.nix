{
  eza,
  host,
  self,
  ...
}:
self.lib.derivations.rust.optimizeArchitecture host (eza.overrideAttrs (old: {
  patches = (old.patches or []) ++ [./filesystem-optimizations.patch];
}))
