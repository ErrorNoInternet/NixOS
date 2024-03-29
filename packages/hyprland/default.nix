{
  architectures,
  inputs',
  self,
  system,
  ...
}:
with self.lib.derivations;
  optimizeArchitecture {inherit architectures system;}
  (optimizeLtoMeson (inputs'.hyprland.packages.default.overrideAttrs (old: {
    prePatch = ''
      git apply ${./remove-wallpapers.patch}
    '';
  })))
