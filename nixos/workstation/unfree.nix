{lib, ...}: {
  nixpkgs.config.allowUnfreePredicate = pkg:
    lib.any (isUnfree: isUnfree)
    (map (unfreePkg: lib.hasPrefix unfreePkg (lib.getName pkg)) [
      "osu-lazer-bin"
      "spotify"
      "steam"

      "geekbench"
      "ookla-speedtest"
      "unigine-heaven"

      "cuda_cccl"
      "cuda_cudart"
      "cuda_nvcc"
      "cudatoolkit"
      "libcublas"
      "libcufft"
      "libnpp"
      "nvidia-settings"
      "nvidia-x11"
    ]);
}
