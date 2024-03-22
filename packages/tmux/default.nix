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
        rev = "3c3643f580ca718a5f6bbeea81abeb0a8bbdb131";
        hash = "sha256-IfNBlxRcGICztKmACA7Vx9gaEVBI2UWf5qXWZ9H2+70=";
      };
      patches = [];
    }
    // lib.attrsets.optionalAttrs (system == "x86_64-linux") {
      NIX_CFLAGS_COMPILE = (old.NIX_CFLAGS_COMPILE or "") + " -march=haswell -mtune=haswell";
    })
