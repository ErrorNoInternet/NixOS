{
  inputs,
  lib,
  self,
  withSystem,
  ...
}: let
  modules = [
    {
      name = "derivations";
      path = ./derivations;
    }
    {
      name = "droid";
      path = ./droid.nix;
    }
    {
      name = "nixos";
      path = ./nixos.nix;
    }
  ];
in {
  flake.lib = builtins.listToAttrs (map (
      module: {
        inherit (module) name;
        value = import module.path {
          inherit inputs lib self withSystem;
        };
      }
    )
    modules);
}
