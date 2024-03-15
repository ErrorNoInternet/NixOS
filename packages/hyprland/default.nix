{
  inputs',
  enableXWayland ? true,
  enableNvidiaPatches ? false,
  ...
}:
inputs'.hyprland.packages.hyprland.overrideAttrs (_: {
  prePatch = ''
    git apply ${./remove-wallpapers.patch} ${./remove-size-predictions.patch}
  '';
  inherit enableXWayland enableNvidiaPatches;
})
