{ pkgs, ... }:

pkgs.rustPlatform.buildRustPackage rec {
    pname = "hsize";
    version = "1.0.1";
    cargoHash = "sha256-ParDbdVivWfwmL8MZEH5C6vMkDvaCPpYxS4wmkXpFw8=";
    src = pkgs.fetchFromGitHub {
        owner = "ErrorNoInternet";
        repo = pname;
        rev = "b852fd3db51c7008113e61a82330314caba292ad";
        hash = "sha256-vd7znBHU94KEKqtx55jFNzrrEGaCzThMx3bKN0QNags=";
    };
}
