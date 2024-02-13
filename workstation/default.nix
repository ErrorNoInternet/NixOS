{
  inputs,
  self,
  withSystem,
  ...
}: let
  mkSystem = name: system:
    withSystem system ({
      inputs',
      self',
      ...
    }:
      inputs.nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs' inputs self' self;};
        modules = [
          ./common.nix
          ./hosts/${name}
          ./hosts/${name}/hardware.nix
          {host = {inherit name system;};}
        ];
      });
in {
  flake.nixosConfigurations = {
    NixBtw = mkSystem "NixBtw" "x86_64-linux";
    Rescanix = mkSystem "Rescanix" "x86_64-linux";
  };
}
