{inputs'}:
inputs'.neovim-nightly.packages.neovim.overrideAttrs (oldAttrs: {
  patches =
    (oldAttrs.patches or [])
    ++ [./remove-fold-numbers.patch];
})
