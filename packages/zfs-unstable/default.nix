{
  fetchFromGitHub,
  zfs_unstable,
  ...
}: let
  inherit
    (import ./source.nix {inherit fetchFromGitHub;})
    version
    src
    patches
    ;
in
  zfs_unstable.overrideAttrs (old: {
    name = "zfs-user-${version}";
    inherit version src;
    patches = (old.patches or []) ++ patches;
  })
