{kitty, ...}:
kitty.overrideAttrs (old: {
  patches =
    (old.patches or [])
    ++ [
      ./parse-base10-rgb.patch
      ./remove-resize-text.patch
      ./thicker-braille-dots.patch
    ];
})
