{
  fetchpatch,
  host,
  rsync,
  self,
  ...
}:
self.lib.derivations.c.optimizeAll host
(rsync.overrideAttrs (old: {
  patches =
    (old.patches or [])
    ++ [
      (fetchpatch {
        name = "clone-dest.patch";
        url = "https://raw.githubusercontent.com/RsyncProject/rsync-patches/master/clone-dest.diff";
        hash = "sha256-wyC9Sz6Vi3Owdei85+IkK0MLp1Zghd8q6FeLjdVIOyg=";
      })
    ];
}))
