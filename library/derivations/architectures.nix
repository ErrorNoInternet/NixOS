{lib, ...}: let
  validArchitectures = [
    "cortex-a72"
    "generic"
    "haswell"
    "x86-64-v3"
  ];

  inherit (builtins) elem;
  inherit (lib) types;
in {
  type = types.enum validArchitectures;

  toC = architecture:
    assert (elem architecture validArchitectures);
      if architecture == "cortex-a72"
      then "cortex-a72+crypto"
      else architecture;

  toRust = architecture: architecture;
}
