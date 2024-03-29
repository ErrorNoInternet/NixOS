{
  architectures,
  inputs',
  self,
  system,
  ...
}:
with self.lib.derivations;
  optimizeArchitecture {inherit architectures system;}
  (optimizeLto (inputs'.nix-super.packages.default.overrideAttrs {
    doCheck = false;
    doInstallCheck = false;
  }))
