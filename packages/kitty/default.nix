{
  host,
  kitty,
  self,
  ...
}:
self.lib.derivations.c.optimizeAll host (kitty.overrideAttrs (old: {
  patches =
    (old.patches or [])
    ++ [
      ./parse-base10-rgb.patch
      ./remove-initial-color.patch
      ./remove-resize-text.patch
      ./thicker-braille-dots.patch
    ];
}))
