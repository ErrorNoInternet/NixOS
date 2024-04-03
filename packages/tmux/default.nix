{
  fetchFromGitHub,
  host,
  self,
  tmux,
  ...
}:
self.lib.derivations.c.optimizeAll host (tmux.overrideAttrs {
  src = fetchFromGitHub {
    owner = "tmux";
    repo = "tmux";
    rev = "3c3643f580ca718a5f6bbeea81abeb0a8bbdb131";
    hash = "sha256-IfNBlxRcGICztKmACA7Vx9gaEVBI2UWf5qXWZ9H2+70=";
  };
  patches = [];
})
