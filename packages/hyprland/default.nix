{inputs', ...}:
inputs'.hyprland.packages.default.overrideAttrs {
  prePatch = ''
    git apply ${./remove-wallpapers.patch}
  '';
}
