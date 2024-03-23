{inputs', ...}:
inputs'.hyprwm-contrib.packages.scratchpad.overrideAttrs (old: {
  patches =
    (old.patches or [])
    ++ [
      ./fix-grammar.patch
      ./transient-notifications.patch
    ];
})
