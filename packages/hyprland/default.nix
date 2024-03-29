{
  inputs',
  self,
  system,
  cpus ? {x86_64-linux = "haswell";},
  ...
}:
self.lib.derivations.optimizeNative {inherit system cpus;}
(self.lib.derivations.optimizeLto (inputs'.hyprland.packages.default.overrideAttrs {
  prePatch = ''
    git apply ${./remove-wallpapers.patch}
  '';
}))
