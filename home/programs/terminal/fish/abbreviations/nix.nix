{
  programs.fish.shellAbbrs = {
    "-insecure" = {
      position = "anywhere";
      expansion = "NIXPKGS_ALLOW_INSECURE=1";
    };
    "-unfree" = {
      position = "anywhere";
      expansion = "NIXPKGS_ALLOW_UNFREE=1";
    };

    nb = "nix build";
    nd = "nix develop -c fish";
    nr = "nix run";
    nre = "nix repl";
    ns = "nix shell";
    nss = "nix-shell --run fish -p";
  };
}
