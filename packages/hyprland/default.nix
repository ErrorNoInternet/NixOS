{
  host,
  inputs',
  self,
  ...
}:
with self.lib.derivations;
  optimizeArchitecture host
  (meson.optimizeLto (inputs'.hyprland.packages.default.overrideAttrs {
    prePatch = ''
      git apply ${./remove-wallpapers.patch}
    '';
  }))
