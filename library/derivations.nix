rec {
  mkFlags = old: flags: {
    NIX_CFLAGS_COMPILE = "${(old.NIX_CFLAGS_COMPILE or "")} ${flags}";
    NIX_CXXFLAGS_COMPILE = "${(old.NIX_CXXFLAGS_COMPILE or "")} ${flags}";
  };

  optimizeLto = derivation:
    derivation.overrideAttrs (old: (mkFlags old "-flto"));

  optimizeNative = {
    system,
    cpus,
  }: derivation:
    if (builtins.elem system ["x86_64-linux"])
    then derivation.overrideAttrs (old: (mkFlags old "-march=${cpus.${system}} -mtune=${cpus.${system}}"))
    else derivation;
}
