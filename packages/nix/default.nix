{
  cpus,
  inputs',
  self,
  system,
  ...
}:
self.optimizeNative {inherit cpus system;}
(self.optimizeLto (inputs'.nix-super.packages.default.overrideAttrs {
  doCheck = false;
  doInstallCheck = false;
}))
