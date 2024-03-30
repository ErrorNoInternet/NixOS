{
  host,
  inputs',
  self,
  ...
}:
with self.lib.derivations;
  optimizeArchitecture host
  (optimizeLto (inputs'.nix-super.packages.default.overrideAttrs {
    doCheck = false;
    doInstallCheck = false;
  }))
