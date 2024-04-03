rec {
  mkFlags = old: flags: {
    RUSTFLAGS = "${(old.RUSTFLAGS or "")} ${flags}";
  };

  optimizeAll = host: derivation:
    optimizeArchitecture host (optimizeLto (optimize derivation));

  optimize = derivation:
    derivation.overrideAttrs (old: (mkFlags old "-Ccodegen-units=1"));

  optimizeLto = derivation:
    derivation.overrideAttrs {CARGO_PROFILE_RELEASE_LTO = "true";};

  optimizeArchitecture = {
    system,
    architectures,
  }: derivation:
    if (builtins.elem system ["x86_64-linux"])
    then derivation.overrideAttrs (old: (mkFlags old "-Ctarget-cpu=${architectures.${system}}"))
    else derivation;
}
