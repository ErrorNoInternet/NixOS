{vesktop, ...}:
vesktop.overrideAttrs (old: {
  patches = (old.patches or []) ++ [./readonly-fix.patch];
})
