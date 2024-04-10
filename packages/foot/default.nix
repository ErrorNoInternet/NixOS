{
  foot,
  host,
  self,
  ...
}:
self.lib.derivations.c.optimizeAllExceptLto host (
  foot.overrideAttrs (old: {
    patches =
      (old.patches or [])
      ++ [
        ./fix-glyph-misalignment.patch
        ./fullscreen-transparency.patch
      ];
  })
)
