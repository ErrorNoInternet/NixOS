{
  inputs',
  enableXWayland ? true,
  enableNvidiaPatches ? false,
}:
inputs'.hyprland.packages.hyprland.overrideAttrs (oldAttrs: {
  prePatch = ''
    git apply ${./remove-wallpapers.patch}
  '';
  inherit enableXWayland enableNvidiaPatches;
})
