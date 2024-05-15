{
  fetchFromGitHub,
  host,
  self,
  tmux,
  ...
}:
self.lib.derivations.c.optimizeAll host (tmux.overrideAttrs {
  version = "3.5-next";

  src = fetchFromGitHub {
    owner = "tmux";
    repo = "tmux";
    rev = "3823fa2c577d440649a84af660e4d3b0c095d248";
    hash = "sha256-L/Mgzl95RxePUuZt+XgmhTpU1TPJmGUgJcWooAgcdQ0=";
  };
  patches = [];
})
