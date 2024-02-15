{
  programs.fish.shellAbbrs = let
    anywhere = expansion: {
      inherit expansion;
      position = "anywhere";
    };
  in {
    "/insecure" = anywhere "NIXPKGS_ALLOW_INSECURE=1";
    "/unfree" = anywhere "NIXPKGS_ALLOW_UNFREE=1";

    "/es" = anywhere "--extra-substituters";
    "/etpk" = anywhere "--extra-trusted-public-keys";
    "/s" = anywhere "--substituters";
    "/tpk" = anywhere "--trusted-public-keys";
    "/ncnt" = anywhere "--narinfo-cache-negative-ttl 0";

    nb = "nix build";
    nd = "nix develop -c fish";
    nr = "nix run";
    nre = "nix repl";
    ns = "nix shell";
    nss = "nix-shell --run fish -p";
  };
}
