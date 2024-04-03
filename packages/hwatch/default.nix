{
  host,
  hwatch,
  self,
  ...
}:
self.lib.derivations.rust.optimizeAll host
(hwatch.overrideAttrs (old: {
  patches =
    (old.patches or [])
    ++ [
      ./precise-intervals.patch
      ./remove-help-banner.patch
    ];
}))
