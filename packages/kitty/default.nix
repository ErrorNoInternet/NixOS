{
  architectures,
  kitty,
  self,
  system,
  ...
}:
with self.lib.derivations;
  optimizeArchitecture {inherit architectures system;}
  (optimizeLto (kitty.overrideAttrs (old: {
    patches =
      (old.patches or [])
      ++ [
        ./parse-base10-rgb.patch
        ./remove-resize-text.patch
        ./thicker-braille-dots.patch
      ];
  })))
