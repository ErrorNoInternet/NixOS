{
  host,
  inputs',
  self,
  ...
}:
self.lib.derivations.c.optimizeAll host
(inputs'.nix-super.packages.default.overrideAttrs (old: {
  patches =
    (old.patches or [])
    ++ [
      ./allow-failing-substituters.patch
      ./fix-eval-cache.patch
    ];

  doCheck = false;
  doInstallCheck = false;
}))
