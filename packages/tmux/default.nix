{
  fetchFromGitHub,
  lib,
  system,
  tmux,
  ...
}:
tmux.overrideAttrs (old:
    {
      src = fetchFromGitHub {
        owner = "tmux";
        repo = "tmux";
        rev = "b79e28b2c30e7ef9b1f7ec6233eeb70a1a177231";
        hash = "sha256-O9a5qL10VCPNSbXxGaRYGq9VZbEsAL/P9ozsvnqhrKM=";
      };
      patches = [];
    }
    // lib.attrsets.optionalAttrs (system == "x86_64-linux") {
      NIX_CFLAGS_COMPILE = (old.NIX_CFLAGS_COMPILE or "") + " -march=haswell -mtune=haswell";
    })
