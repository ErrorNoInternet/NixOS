{
  architectures,
  hwatch,
  self,
  system,
  ...
}:
self.lib.derivations.rust.optimizeAll
{inherit architectures system;}
(hwatch.overrideAttrs (old: {
  patches =
    (old.patches or [])
    ++ [
      ./precise-intervals.patch
      ./remove-help-banner.patch
    ];
}))
