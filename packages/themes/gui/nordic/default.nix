{nordic, ...}:
nordic.overrideAttrs (old: {
  patches =
    (old.patches or [])
    ++ [
      ./gtk-transparent-context-menu.patch
      ./qt-remove-button-icons.patch
    ];
})
