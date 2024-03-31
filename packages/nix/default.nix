{
  host,
  inputs',
  self,
  ...
}:
self.lib.derivations.c.optimizeAll host
inputs'.nix-super.packages.default.overrideAttrs {
  doCheck = false;
  doInstallCheck = false;
}
