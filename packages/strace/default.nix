{strace, ...}:
strace.overrideAttrs (old: {
  patches = (old.patches or []) ++ [./colors.patch];
})
