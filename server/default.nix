{
  inputs,
  self,
  ...
}: let
  mkSystem = name:
    inputs.nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs self;};
      modules = [
        ./common.nix
        ./hosts/${name}
      ];
    };

  mkHmSystem = name:
    inputs.nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs self;};
      modules = [
        ./common.nix
        ./hosts/${name}

        inputs.home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = {inherit inputs self;};

            users.snowflake = {...}: {
              imports = [
                ../home/common.nix
                ../home/hosts/${name}.nix
              ];
            };
          };
        }
      ];
    };
in {
  flake.nixosConfigurations = {
    Crix = mkSystem "Crix";
    Pix = mkHmSystem "Pix";
  };
}
