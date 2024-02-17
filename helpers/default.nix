{
  inputs,
  self,
  withSystem,
  ...
}: {
  flake.lib = {
    systems = import ./systems.nix {inherit inputs self withSystem;};
  };
}
