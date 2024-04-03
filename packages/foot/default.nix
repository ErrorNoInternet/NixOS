{
  fetchFromGitea,
  foot,
  host,
  self,
  ...
}:
self.lib.derivations.c.optimizeAllExceptLto host (
  foot.overrideAttrs (old: {
    src = fetchFromGitea {
      domain = "codeberg.org";
      owner = "dnkl";
      repo = "foot";
      rev = "9fcf5977c05686d55892d32fa3f980b03ef1b30a";
      hash = "sha256-8y0w+h1g7of/A+7KN9PFj+DSNfnIzJv5k9jFA9piE2M=";
    };

    patches =
      (old.patches or [])
      ++ [
        ./fix-glyph-misalignment.patch
        ./fullscreen-transparency.patch
      ];
  })
)
