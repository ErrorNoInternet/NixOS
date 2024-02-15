{nordic}:
nordic.overrideAttrs (oldAttrs: {
  patches =
    (oldAttrs.patches or [])
    ++ [./transparent-context-menu.patch];
})
