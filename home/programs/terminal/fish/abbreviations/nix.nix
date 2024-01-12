{
  programs.fish.shellAbbrs = {
    nd = "nix develop -c fish";
    nr = "nix run";
    nre = "nix repl";
    ns = "nix shell";
    nss = "nix-shell --run fish -p";
  };
}
