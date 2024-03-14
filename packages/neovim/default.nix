{inputs', ...}:
inputs'.neovim-nightly.packages.default.overrideAttrs (oldAttrs: {
  patches =
    (oldAttrs.patches or [])
    ++ [./remove-fold-numbers.patch];
})
