{nix-tree, ...}:
nix-tree.overrideAttrs (old: {
  patches = (old.patches or []) ++ [./ignore-xdg-state.patch];
})
