{inputs', ...}:
inputs'.hyprwm-contrib.packages.scratchpad.overrideAttrs (oldAttrs: {
  patches =
    (oldAttrs.patches or [])
    ++ [./fix-grammar.patch];
})
