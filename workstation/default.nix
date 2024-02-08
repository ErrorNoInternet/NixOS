{
  inputs,
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
        pkgs = import inputs.nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
        specialArgs = {inherit inputs' inputs self';};

        modules = [
          ./common.nix
          ./hosts/${name}
          ./hosts/${name}/hardware.nix
          {
            host = {
              name = "${name}";
              system = "${system}";
            };
          }
        ];
      });
in {
  flake.nixosConfigurations = {
    NixBtw = mkSystem "NixBtw" "x86_64-linux";
    Rescanix = mkSystem "Rescanix" "x86_64-linux";
  };
}
