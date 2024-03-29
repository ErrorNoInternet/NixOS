{
  architectures,
  inputs',
  self,
  system,
  ...
}:
with self.lib.derivations;
  optimizeArchitecture {inherit architectures system;}
  (optimizeLto (inputs'.neovim-nightly.packages.default.overrideAttrs
    (old: {
      patches =
        (old.patches or [])
        ++ [./remove-fold-numbers.patch];
    })))
