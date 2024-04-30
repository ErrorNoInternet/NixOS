{
  host,
  prismlauncher-unwrapped,
  self,
  ...
}:
with self.lib.derivations;
  c.optimizeAllExceptLto host
  (cmake.optimizeLto
    (prismlauncher-unwrapped.overrideAttrs (old: {
      patches = (old.patches or []) ++ [./bmclapi-downloads.patch];
    })))
