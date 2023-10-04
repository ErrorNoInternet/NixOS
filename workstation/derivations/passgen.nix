{ pkgs, ... }:

pkgs.rustPlatform.buildRustPackage rec {
    pname = "passgen";
    version = "0.1.0";
    cargoHash = "sha256-Ytrlsvdx1Bp8YSD/G30xwSFjPxK8KNAʊ8mKT4X5twRM=";
    src = pkgs.fetchFromGitHub {
        owner = "ErrorNoInternet";
        repo = pname;
        rev = "d5a8324a37471a41eb6e203756daf2a4b94a0b55";
        hash = "sha256-YG0DJ5dbthH1zSeStp1QF9k0TpyyBnClaeTLBNJ+oxs=";
    };
}
