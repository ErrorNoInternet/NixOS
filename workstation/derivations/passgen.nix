{ pkgs, ... }:

pkgs.rustPlatform.buildRustPackage rec {
    pname = "passgen";
    version = "0.1.0";
    cargoHash = "";
    src = pkgs.fetchFromGitHub {
        owner = "ErrorNoInternet";
        repo = pname;
        rev = "d5a8324a37471a41eb6e203756daf2a4b94a0b55";
        hash = "";
    };
}
