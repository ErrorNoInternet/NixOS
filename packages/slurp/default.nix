{
  host,
  makeWrapper,
  self,
  slurp,
  ...
}:
self.lib.derivations.c.optimizeAll host (slurp.overrideAttrs (old: {
  nativeBuildInputs = (old.nativeBuildInputs or []) ++ [makeWrapper];
  postFixup = ''
    wrapProgram $out/bin/slurp \
      --add-flags "-b \"#eceff420\" -B \"#eceff420\" -c \"#2e3440ff\""
  '';
}))
