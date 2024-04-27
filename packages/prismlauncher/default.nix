{
  host,
  prismlauncher-unwrapped,
  self,
  ...
}:
self.lib.derivations.c.optimizeAllExceptLto host
(prismlauncher-unwrapped.overrideAttrs (old: {
  patches = (old.patches or []) ++ [./bmclapi-downloads.patch];
}))
