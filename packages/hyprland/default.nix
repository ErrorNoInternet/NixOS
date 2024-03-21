{inputs', ...}:
inputs'.hyprland.packages.default.overrideAttrs (old: {
  prePatch = ''
    git apply ${./remove-wallpapers.patch}
  '';
})
