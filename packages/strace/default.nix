{
  host,
  self,
  strace,
  ...
}:
with self.lib.derivations;
  c.optimizeAllExceptLto host (autotools.optimizeLto
    (strace.overrideAttrs (old: {
      patches = (old.patches or []) ++ [./colors.patch];
    })))
