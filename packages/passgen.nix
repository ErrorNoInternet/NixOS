{
  fetchFromGitHub,
  rustPlatform,
}:
rustPlatform.buildRustPackage rec {
  pname = "passgen";
  version = "0.1.0";
  cargoHash = "sha256-YtrlsvdxlBp8YSD/G3oxwSFjPxK8KNAv8mKT4X5twRM=";
  src = fetchFromGitHub {
    owner = "ErrorNoInternet";
    repo = pname;
    rev = "3ea4efc48abdf0a39afa531c3d72b71da1193941";
    hash = "sha256-fVKER6eO3P1amTKg9q4yEB4zVPks/T9ND/h+sPnepEI=";
  };
}
