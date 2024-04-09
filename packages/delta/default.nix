{
  delta,
  host,
  self,
  ...
}:
self.lib.derivations.rust.optimizeAll host delta
