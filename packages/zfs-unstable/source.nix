{
  fetchFromGitHub,
  fetchpatch,
}: {
  version = "2.2.3-unstable-2024-04-23";

  src = fetchFromGitHub {
    owner = "openzfs";
    repo = "zfs";
    rev = "87d81d1d13e0ef848d2d533a4f12f5de41026e73";
    hash = "sha256-X4DsZ1Ex1IU2+iNxbtoujozg5RkJfhmEkZpr88ghf8s=";
  };

  patches = [
    ./fiemap.patch

    (fetchpatch {
      name = "zap-shrinking.patch";
      url = "https://github.com/openzfs/zfs/pull/15888.diff";
      hash = "sha256-RMNtO+dVf7f+V87lrNeOJV9aL9KI/M8rfc9WsNE0rdA=";
    })

    (fetchpatch {
      name = "chacha20-poly1305.patch";
      url = "https://github.com/openzfs/zfs/pull/14249.diff";
      hash = "sha256-T2gO82f20zkAnmrx8UGwKf307y05gfgDENPif9PdbLs=";
    })
  ];
}
