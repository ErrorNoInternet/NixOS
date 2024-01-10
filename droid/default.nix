{
  inputs,
  self,
  ...
}: let
  mkSystem = name:
    inputs.nix-on-droid.lib.nixOnDroidConfiguration {
      extraSpecialArgs = {inherit inputs;};
      modules = [
        ./common.nix
        ./hosts/${name}.nix
        {environment.sessionVariables.HOSTNAME = "${name}";}

        {
          home-manager = {
            extraSpecialArgs = {
              inherit inputs self;
              osConfig = {};
            };
            sharedModules = [
              {nix.package = self.packages.aarch64-linux.nix;}
              ../home/common.nix
              ../home/hosts/${name}.nix
            ];
          };
        }
      ];
    };
in {
  flake.nixOnDroidConfigurations = {
    ErrorNoPhone = mkSystem "ErrorNoPhone";
  };
}
