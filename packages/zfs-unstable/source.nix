{fetchFromGitHub}: {
  version = "2.2.3-unstable-2024-04-10";
  src = fetchFromGitHub {
    owner = "openzfs";
    repo = "zfs";
    rev = "d98973dbdd5a85b6c8a8556d5bd5c9903e2d2ee6";
    hash = "sha256-Dt/MRIjqqiJOFwpkfoJPO23Eu+CrkIg2RaIUfIa9AHk=";
  };
}
