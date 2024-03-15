{inputs', ...}:
inputs'.neovim-nightly.packages.default.overrideAttrs (old: {
  patches =
    (old.patches or [])
    ++ [./remove-fold-numbers.patch];
})
