rec {
  mkFlags = old: flags: {
    configureFlags = (old.cmakeFlags or []) ++ flags;
  };

  optimizeLto = derivation:
    derivation.overrideAttrs (old: (mkFlags old [
      "--enable-lto"
    ]));
}
