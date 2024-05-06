{
  host,
  inputs',
  self,
  ...
}:
with self.lib.derivations;
  c.optimizeAllExceptLto host (
    inputs'.hyprland.packages.default.overrideAttrs (old: {
      prePatch = ''
        git apply ${./remove-wallpapers.patch}
      '';
    })
  )
