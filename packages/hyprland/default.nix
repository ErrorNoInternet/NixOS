{inputs', ...}:
inputs'.hyprland.packages.default.overrideAttrs (old: {
  prePatch = ''
    git apply ${./remove-wallpapers.patch}
  '';

  patches =
    (old.patches or [])
    ++ [./remove-size-predictions.patch];
})
