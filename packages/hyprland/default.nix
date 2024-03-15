{
  inputs',
  enableXwayland ? true,
  ...
}:
inputs'.hyprland.packages.hyprland.overrideAttrs (_: {
  prePatch = ''
    git apply ${./remove-wallpapers.patch} ${./remove-size-predictions.patch}
  '';

  inherit enableXwayland;
  enableNvidiaPatches = false;
})
