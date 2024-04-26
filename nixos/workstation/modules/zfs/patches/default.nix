{fetchpatch}: [
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
]
