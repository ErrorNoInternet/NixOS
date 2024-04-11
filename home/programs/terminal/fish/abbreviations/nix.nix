{
  programs.fish.shellAbbrs = let
    anywhere = expansion: {
      inherit expansion;
      position = "anywhere";
    };
  in {
    "/insecure" = anywhere "NIXPKGS_ALLOW_INSECURE=1";
    "/unfree" = anywhere "NIXPKGS_ALLOW_UNFREE=1";
    "/unsupported" = anywhere "NIXPKGS_ALLOW_UNSUPPORTED_SYSTEM=1";

    "/c" = anywhere "-c fish";
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
    nB = "nix build";
    nBl = "nix build -L";
    nd = "nix develop -c fish";
    nD = "nix develop";
    nDl = "nix develop -L -c fish";
    ndl = "nix develop -L";
    nf = "nix flake";
    nfc = "nix flake check";
    nfl = "nix flake lock";
    nfm = "nix flake metadata";
    nfmt = "nix fmt";
    nfs = "nix flake show";
    nfu = "nix flake update";
    nL = "nix log";
    nr = "nix run";
    nre = "nix repl";
    nrl = "nix run -L";
    ns = "nix shell";
    nS = "nix-shell --run fish";
    nsl = "nix shell -L";
    nSS = "nix-shell --run fish -p";
    nst = "nix-store";
  };
}
