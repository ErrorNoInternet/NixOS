{kitty, ...}:
kitty.overrideAttrs (old: {
  patches =
    (old.patches or [])
    ++ [
      ./hide-resize-text.patch
      ./parse-base10-rgb.patch
      ./thicker-braille-dots.patch
    ];
})
