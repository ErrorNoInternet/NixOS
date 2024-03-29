{inputs', ...}:
inputs'.attic.packages.attic.overrideAttrs (old: {
  patches =
    (old.patches or [])
    ++ [
      ./https-api-endpoint.patch
      ./optimize-build.patch
      ./watch-source-paths.patch
    ];
})
