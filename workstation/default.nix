{
  inputs,
  self,
  ...
}: let
  mkSystem = name:
    inputs.nixpkgs.lib.nixosSystem {
      pkgs = import inputs.nixpkgs {
        system = "x86_64-linux";
        config.allowUnfree = true;
      };
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

            users.ryan = {...}: {
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
    NixBtw = mkSystem "NixBtw";
    Rescanix = mkSystem "Rescanix";
  };
}
