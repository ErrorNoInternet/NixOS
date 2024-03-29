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
        path = ./derivations.nix;
      }
      {
        name = "systems";
        path = ./systems.nix;
      }
    ];
  in
    builtins.listToAttrs (map (module:
      {
        inherit (module) name;
        value = import module.path {
          inherit inputs lib self withSystem;
        };
      }
      modules));
}
