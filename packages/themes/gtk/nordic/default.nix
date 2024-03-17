{nordic, ...}:
nordic.overrideAttrs (old: {
  patches =
    (old.patches or [])
    ++ [./transparent-context-menu.patch];
})
