{
  host,
  imhex,
  self,
  ...
}:
with self.lib.derivations;
  c.optimizeAllExceptLto host (
    cmake.optimizeLto
    imhex
  )
