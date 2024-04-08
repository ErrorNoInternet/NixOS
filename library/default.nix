{
  inputs,
  lib,
  self,
  withSystem,
  ...
}: {
  flake.lib = let
    modules = [
      {
        name = "derivations";
        path = ./derivations;
      }
      {
        name = "nixos";
        path = ./nixos.nix;
      }
    ];
  in
    builtins.listToAttrs (map (
        module: {
          inherit (module) name;
          value = import module.path {
            inherit inputs lib self withSystem;
          };
        }
      )
      modules);
}
