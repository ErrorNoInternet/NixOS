{ pkgs ? import <nixpkgs> {  } }:
pkgs.rustPlatform.buildRustPackage rec {
    pname = "hsize";
    version = "1.0.1";
    cargoHash = "sha256-ekzfu1Sfg4GjUGPp4GWpxZVzQUwafjFFTXIfc2m6JR8=";
    src = pkgs.fetchFromGitHub {
        owner = "ErrorNoInternet";
        repo = pname;
        rev = "a30620cc211c41391ccdd75a00fbf62ccceb315c";
        hash = "sha256-ceX7RKRsdw5kPBwWouF3gsaaGKiXYy2nQDNJk6F/NAw=";
    };
}
