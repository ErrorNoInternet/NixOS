{
  fetchFromGitHub,
  zfs_unstable,
  ...
}: let
  inherit (import ./source.nix {inherit fetchFromGitHub;}) src version;
in
  zfs_unstable.overrideAttrs (old: {
    inherit src version;
    name = "zfs-user-${version}";

    patches = (old.patches or []) ++ [./chacha20poly1305.patch];
  })
