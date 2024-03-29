{
  architectures,
  inputs',
  self,
  system,
  ...
}:
self.lib.derivations.optimizeArchitecture {inherit architectures system;}
(self.lib.derivations.optimizeLto (inputs'.neovim-nightly.packages.default.overrideAttrs
  (old: {
    patches =
      (old.patches or [])
      ++ [./remove-fold-numbers.patch];
  })))
