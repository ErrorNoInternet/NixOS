{
  fetchFromGitHub,
  rustPlatform,
  ...
}:
rustPlatform.buildRustPackage {
  pname = "passgen";
  version = "0.1.0";

  src = let
    repo = fetchFromGitHub {
      owner = "ErrorNoInternet";
      repo = "passgen";
      rev = "e538b2ab50bbf514db50101169dec3a16e12e9f1";
      hash = "sha256-DSLrI3O/0sXbZuWy2ErbBoJhJ/OZu+oso7Tf0SlGVnk=";
    };
  in "${repo}/rust";
  cargoHash = "sha256-RqW5pa+ExHhii1e28HMz1sUFCmDelSZ9dWcOf8CWd+c=";

  patches = [./reproducible.patch];
}
