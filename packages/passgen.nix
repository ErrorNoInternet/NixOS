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
    rev = "2abfd4a99aa90c2b2e41a17ef3f6602dbb595db6";
    hash = "sha256-hXTTw2rMS3IYXc8xOOIoKVGe3c/1U3/BK1OL7jDZAvQ=";
  };
}
