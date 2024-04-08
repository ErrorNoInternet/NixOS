{vesktop, ...}:
vesktop.overrideAttrs (old: {
  patches =
    (old.patches or [])
    ++ [
      ./readonly-fix.patch
      ./custom-splash.patch
    ];
})
