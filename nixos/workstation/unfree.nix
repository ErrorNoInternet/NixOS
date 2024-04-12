{lib, ...}: {
  nixpkgs.config.allowUnfreePredicate = pkg:
    lib.any (isUnfree: isUnfree)
    (map (unfreePkg: lib.hasPrefix unfreePkg (lib.getName pkg)) [
      "cuda_cccl"
      "cuda_cudart"
      "cuda_nvcc"
      "cudatoolkit"
      "libcublas"
      "libcufft"
      "libnpp"
      "nvidia-x11"
      "nvidia-settings"
      "osu-lazer-bin"
      "spotify"
      "steam"
    ]);
}
