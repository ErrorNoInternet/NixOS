{
  cpus ? {x86_64-linux = "haswell";},
  inputs',
  self,
  system,
  ...
}:
self.lib.derivations.optimizeNative {inherit cpus system;}
(inputs'.hyprland.packages.default.overrideAttrs {
  prePatch = ''
    git apply ${./remove-wallpapers.patch}
  '';
})
