{lib, ...}: let
  inherit (lib) any getName hasPrefix;
in {
  nixpkgs.config.allowUnfreePredicate = pkg:
    any (isUnfree: isUnfree)
    (map (unfreePkg: hasPrefix unfreePkg (getName pkg)) [
      "osu-lazer-bin"
      "spotify"
      "steam"

      "geekbench"
      "ookla-speedtest"
      "unigine-heaven"

      "cuda"
      "cudatoolkit"
      "libcu"
      "libnpp"
      "libnvjitlink"
      "nvidia-settings"
      "nvidia-x11"
    ]);
}
