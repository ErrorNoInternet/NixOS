{kitty}:
kitty.overrideAttrs (oldAttrs: {
  patches =
    (oldAttrs.patches or [])
    ++ [
      ./hide-resize-text.patch
      ./parse-base10-rgb.patch
      ./thicker-braille-dots.patch
    ];
})
