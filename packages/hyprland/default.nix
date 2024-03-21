{inputs', ...}:
inputs'.hyprland.packages.default.overrideAttrs (_: {
  prePatch = ''
    git apply ${./remove-wallpapers.patch}
  '';
})
