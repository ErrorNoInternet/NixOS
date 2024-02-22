{
  inputs,
  lib,
  self,
  withSystem,
  ...
}: {
  flake.lib = {
    systems = import ./systems.nix {inherit inputs lib self withSystem;};
  };
}
