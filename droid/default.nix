{inputs, ...}: let
  mkSystem = name:
    inputs.nix-on-droid.lib.nixOnDroidConfiguration {
      extraSpecialArgs = {inherit inputs;};
      modules = [
        ./common.nix
        ./hosts/${name}.nix
        {environment.sessionVariables.HOSTNAME = "${name}";}

        {
          home-manager = {
            extraSpecialArgs = {inherit inputs;};
            sharedModules = [
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
