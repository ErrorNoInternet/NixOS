rec {
  mkFlags = old: flags: {
    cmakeFlags = (old.cmakeFlags or []) ++ flags;
  };

  optimizeLto = derivation:
    derivation.overrideAttrs (old: (mkFlags old [
      "-DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON"
    ]));
}
