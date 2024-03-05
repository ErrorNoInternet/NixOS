{ hwatch }:
hwatch.overrideAttrs (oldAttrs: {
  patches = (oldAttrs.patches or [ ]) ++ [
    ./optimize-build.patch
    ./precise-intervals.patch
    ./remove-help-banner.patch
  ];
})
