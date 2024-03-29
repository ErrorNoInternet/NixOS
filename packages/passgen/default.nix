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
      rev = "ef1e8b819b22879f5e3350b6fd31637bb7f5a4ec";
      hash = "sha256-JD4/idZNyFWVUvxBM8WBh6Ori/K4ARW3NtuvuhMIAeo=";
    };
  in "${repo}/rust";
  cargoHash = "sha256-/z7QD76wtFiReGmhmhPp3K4E88kFxzkHtXvof5phTEY=";

  patches = [./reproducible.patch];
}
