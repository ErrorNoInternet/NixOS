{
  host,
  inputs',
  self,
  ...
}:
self.lib.derivations.rust.optimizeAll host
(inputs'.attic.packages.attic.overrideAttrs (old: {
  patches =
    (old.patches or [])
    ++ [
      ./https-api-endpoint.patch
      ./watch-source-paths.patch
    ];
}))
