{
  fetchFromGitHub,
  fetchpatch,
}: {
  version = "2.2.3-unstable-2024-04-10";

  src = fetchFromGitHub {
    owner = "openzfs";
    repo = "zfs";
    rev = "d98973dbdd5a85b6c8a8556d5bd5c9903e2d2ee6";
    hash = "sha256-Dt/MRIjqqiJOFwpkfoJPO23Eu+CrkIg2RaIUfIa9AHk=";
  };

  patches = [
    (fetchpatch {
      name = "chacha20-poly1305.patch";
      url = "https://github.com/openzfs/zfs/pull/14249.patch";
      hash = "sha256-T2gO82f20zkAnmrx8UGwKf307y05gfgDENPif9PdbLs=";
    })
  ];
}
