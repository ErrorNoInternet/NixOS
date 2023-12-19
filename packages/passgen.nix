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
    rev = "86ed856bc3910f45b70cbaddf58f2ba7d7e715fd";
    hash = "sha256-0xTH+zfxR6w0C3tgU9CSI4v7k+sO6/eII54aTELf00s=";
  };
}
