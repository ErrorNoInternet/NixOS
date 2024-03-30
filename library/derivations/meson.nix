rec {
  mkFlags = old: flags: {
    mesonBuildFlags = (old.mesonBuildFlags or []) ++ flags;
  };

  optimizeLto = derivation:
    derivation.overrideAttrs (old: (mkFlags old ["-Db_lto=true"]));
}
