{
  architectures,
  system,
  wezterm,
  self,
  ...
}:
with self.lib.derivations.rust;
  optimizeArchitecture {inherit architectures system;}
  (optimizeLto
    (optimize (wezterm.overrideAttrs (old: {
      patches =
        (old.patches or [])
        ++ [
          ./remove-first-configure.patch
          ./remove-set-cursor.patch
        ];
    }))))
