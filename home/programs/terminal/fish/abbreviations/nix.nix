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
    "/i" = anywhere "--impure";
    "/ncnt" = anywhere "--narinfo-cache-negative-ttl 0";
    "/nec" = anywhere "--no-eval-cache";
    "/o" = anywhere "--option";
    "/s" = anywhere "--substituters";
    "/st" = anywhere "--show-trace";
    "/tpk" = anywhere "--trusted-public-keys";

    n = "nix";
    nb = "nix build";
    nd = "nix develop -c fish";
    nr = "nix run";
    nre = "nix repl";
    ns = "nix shell";
    nss = "nix-shell --run fish -p";
  };
}
