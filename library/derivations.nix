{lib, ...}: let
  inherit (lib) strings;
in rec {
  mkFlags = old: flags: {
    NIX_CFLAGS_COMPILE = "${(old.NIX_CFLAGS_COMPILE or "")} ${flags}";
    NIX_CXXFLAGS_COMPILE = "${(old.NIX_CXXFLAGS_COMPILE or "")} ${flags}";
  };

  optimizeLto = derivation:
    derivation.overrideAttrs (old: (mkFlags old "-flto"));

  optimizeNative = {
    system,
    architectures,
  }: derivation:
    if (builtins.elem system ["x86_64-linux"])
    then
      derivation.overrideAttrs (old: (mkFlags old "-march=${architectures.${system}}"
        + (strings.optionalString (!strings.hasPrefix "x86-64" architectures.${system})
          " -mtune=${architectures.${system}}")))
    else derivation;
}
