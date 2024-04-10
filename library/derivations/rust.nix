{self, ...}: rec {
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
    derivation.overrideAttrs (old: (mkFlags old
      "-Ctarget-cpu=${self.lib.derivations.architectures.toRust
        architectures.${system}}"));
}
