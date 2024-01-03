{
  programs.fish.shellAbbrs = {
    nd = "nix develop -c fish";
    nr = "nix run";
    ns = "nix shell";
    nss = "nix-shell --run fish -p";
  };
}
