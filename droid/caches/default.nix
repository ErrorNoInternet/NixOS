{lib, ...}: {
  imports = [
    ./errornobinaries.nix
  ];

  nix = {
    substituters = lib.mkOrder 2000 ["https://nix-on-droid.cachix.org"];
    trustedPublicKeys = ["nix-on-droid.cachix.org-1:56snoMJTXmDRC1Ei24CmKoUqvHJ9XCp+nidK7qkMQrU="];
  };
}
