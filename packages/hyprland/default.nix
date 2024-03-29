{
  architectures,
  inputs',
  self,
  system,
  ...
}:
self.lib.derivations.optimizeArchitecture {inherit architectures system;}
(inputs'.hyprland.packages.default.overrideAttrs (old: {
  prePatch = ''
    git apply ${./remove-wallpapers.patch}
  '';

  mesonBuildFlags = (old.mesonBuildFlags or []) ++ ["-Db_lto=true"];
}))
