{
  fetchFromGitHub,
  rustPlatform,
}:
rustPlatform.buildRustPackage rec {
  pname = "passgen";
  version = "0.1.0";
  cargoHash = "sha256-/z7QD76wtFiReGmhmhPp3K4E88kFxzkHtXvof5phTEY=";
  src = fetchFromGitHub {
    owner = "ErrorNoInternet";
    repo = pname;
    rev = "e222f7604edd06a2bc6e366ed91c37c1297173ff";
    hash = "sha256-Uy0fZUcv3bbM5lack+NMTui9qjFPzCQ+AKnD849lPlU=";
  };
}
