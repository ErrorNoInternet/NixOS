{
  inputs,
  self,
  withSystem,
  ...
}: let
  mkHmServer = name: system:
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

          inputs.home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = {inherit inputs' inputs self' self;};

              users.snowflake = {...}: {
                imports = [
                  ../home/common.nix
                  ../home/hosts/${name}.nix
                ];
              };
            };
          }
        ];
      });
in {
  flake.nixosConfigurations = with self.lib.systems; {
    Crix = mkServer "Crix" "x86_64-linux";
    Pix = mkHmServer "Pix" "aarch64-linux";
  };
}
