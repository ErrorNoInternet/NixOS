{
  architectures,
  inputs',
  self,
  system,
  ...
}:
self.lib.derivations.optimizeArchitecture {inherit architectures system;}
(self.lib.derivations.optimizeLto (inputs'.nix-super.packages.default.overrideAttrs {
  doCheck = false;
  doInstallCheck = false;
}))
