{hwatch}:
hwatch.overrideAttrs (oldAttrs: {
  patches =
    (oldAttrs.patches or [])
    ++ [
      ./optimized-build.patch
      ./precise-intervals.patch
      ./remove-help-banner.patch
    ];
})
