{
  fetchFromGitHub,
  lib,
  tmux,
  ...
}:
lib.overrideDerivation (tmux.overrideAttrs (_: {
  src = fetchFromGitHub {
    owner = "tmux";
    repo = "tmux";
    rev = "b79e28b2c30e7ef9b1f7ec6233eeb70a1a177231";
    hash = "sha256-O9a5qL10VCPNSbXxGaRYGq9VZbEsAL/P9ozsvnqhrKM=";
  };

  patches = [];
})) (_: {
  NIX_CFLAGS_COMPILE = "-march=haswell -mtune=haswell";
})
