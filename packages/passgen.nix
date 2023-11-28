{
  fetchFromGitHub,
  rustPlatform,
  ...
}:
rustPlatform.buildRustPackage rec {
  pname = "passgen";
  version = "0.1.0";
  cargoHash = "sha256-YtrlsvdxlBp8YSD/G3oxwSFjPxK8KNAv8mKT4X5twRM=";
  src = fetchFromGitHub {
    owner = "ErrorNoInternet";
    repo = pname;
    rev = "35dc9480941fc471bca2d4a96a3123d84e38e374";
    hash = "sha256-5jcaWf8A0mW0HixnbxZjqg/6YH8WTG4LRUtYXYsma7o=";
  };
}
