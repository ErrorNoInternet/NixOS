{
  architectures,
  inputs',
  self,
  system,
  ...
}:
with self.lib.derivations;
  optimizeArchitecture {inherit architectures system;}
  (meson.optimizeLto (inputs'.hyprland.packages.default.overrideAttrs {
    prePatch = ''
      git apply ${./remove-wallpapers.patch}
    '';
  }))
