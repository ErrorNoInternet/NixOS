{
  programs.fish.shellAbbrs = {
    "/insecure" = {
      position = "anywhere";
      expansion = "NIXPKGS_ALLOW_INSECURE=1";
    };
    "/unfree" = {
      position = "anywhere";
      expansion = "NIXPKGS_ALLOW_UNFREE=1";
    };

    "/es" = {
      position = "anywhere";
      expansion = "--extra-substituters";
    };
    "/etpk" = {
      position = "anywhere";
      expansion = "--extra-trusted-public-keys";
    };
    "/s" = {
      position = "anywhere";
      expansion = "--substituters";
    };
    "/tpk" = {
      position = "anywhere";
      expansion = "--trusted-public-keys";
    };
    "/ncnt" = {
      position = "anywhere";
      expansion = "--narinfo-cache-negative-ttl 0";
    };

    nb = "nix build";
    nd = "nix develop -c fish";
    nr = "nix run";
    nre = "nix repl";
    ns = "nix shell";
    nss = "nix-shell --run fish -p";
  };
}
