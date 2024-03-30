{
  host,
  inputs',
  self,
  ...
}:
with self.lib.derivations;
  optimizeArchitecture host
  (optimizeLto (inputs'.neovim-nightly.packages.default.overrideAttrs
    (old: {
      patches =
        (old.patches or [])
        ++ [./remove-fold-numbers.patch];
    })))
