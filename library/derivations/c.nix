{
  lib,
  self,
  ...
}: let
  inherit (lib) strings;
in rec {
  mkFlags = old: flags: {
    env = {
      NIX_CFLAGS_COMPILE = "${(old.env.NIX_CFLAGS_COMPILE or old.NIX_CFLAGS_COMPILE or "")} ${flags}";
      NIX_CXXFLAGS_COMPILE = "${(old.env.NIX_CXXFLAGS_COMPILE or old.NIX_CXXFLAGS_COMPILE or "")} ${flags}";
    };
  };

  optimizeAll = host: derivation:
    optimizeArchitecture host (optimizeLto (optimize derivation));

  optimizeAllExceptLto = host: derivation:
    optimizeArchitecture host (optimize derivation);

  optimize = derivation:
    derivation.overrideAttrs (old: (mkFlags old "-pipe -O3"));

  optimizeLto = derivation:
    derivation.overrideAttrs (old: (mkFlags old "-flto"));

  optimizeArchitecture = {
    system,
    architectures,
  }: derivation: let
    platformArchitecture =
      self.lib.derivations.architectures.toC
      architectures.${system};
  in
    if system == "x86_64-linux"
    then
      derivation.overrideAttrs (old: (
        mkFlags old ("-march=${platformArchitecture}"
          + (strings.optionalString
            (!strings.hasPrefix "x86-64-" platformArchitecture)
            " -mtune=${platformArchitecture}"))
      ))
    else if system == "aarch64-linux"
    then
      derivation.overrideAttrs (old: (
        mkFlags old "-mcpu=${platformArchitecture}"
      ))
    else derivation;
}
