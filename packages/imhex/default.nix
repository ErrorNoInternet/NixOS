{
  host,
  imhex,
  self,
  ...
}:
self.lib.derivations.c.optimizeAllExceptLto host imhex
