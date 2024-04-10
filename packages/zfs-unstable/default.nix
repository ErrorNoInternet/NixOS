{
  fetchFromGitHub,
  zfs_unstable,
  ...
}:
zfs_unstable.overrideAttrs (old: {
  inherit (import ./source.nix {inherit fetchFromGitHub;}) src version;
  patches = (old.patches or []) ++ [./chacha20poly1305.patch];
})
