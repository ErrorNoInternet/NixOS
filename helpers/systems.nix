{
  inputs,
  self,
  withSystem,
}: rec {
  mkSystem = type: name: system:
    withSystem system ({
      inputs',
      self',
      ...
    }:
      inputs.nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs' inputs self' self;};
        modules = [
          ../${type}/common.nix
          ../${type}/hosts/${name}
          ../${type}/hosts/${name}/hardware.nix
          {host = {inherit name system;};}
        ];
      });
  mkWorkstation = mkSystem "workstation";
  mkServer = mkSystem "server";
}
