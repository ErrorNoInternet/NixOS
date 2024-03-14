{
  fetchFromGitHub,
  rustPlatform,
  ...
}:
rustPlatform.buildRustPackage {
  pname = "passgen";
  version = "0.1.0";

  patches = [./reproducible.patch];
  src = fetchFromGitHub {
    owner = "ErrorNoInternet";
    repo = "passgen";
    rev = "e222f7604edd06a2bc6e366ed91c37c1297173ff";
    hash = "sha256-Uy0fZUcv3bbM5lack+NMTui9qjFPzCQ+AKnD849lPlU=";
  };
  cargoHash = "sha256-/z7QD76wtFiReGmhmhPp3K4E88kFxzkHtXvof5phTEY=";
}
