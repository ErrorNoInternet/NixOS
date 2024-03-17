{hwatch, ...}:
hwatch.overrideAttrs (old: {
  patches =
    (old.patches or [])
    ++ [
      ./optimize-build.patch
      ./precise-intervals.patch
      ./remove-help-banner.patch
    ];
})
