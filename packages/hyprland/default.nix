{inputs', ...}:
inputs'.hyprland.packages.hyprland.overrideAttrs (old: {
  prePatch = ''
    git apply ${./remove-wallpapers.patch}
  '';

  patches =
    (old.patches or [])
    ++ [./remove-size-predictions.patch];
})
