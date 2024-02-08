{
  inputs,
  withSystem,
  ...
}: let
  mkSystem = name: system:
    withSystem system ({
      inputs',
      self',
    }:
      inputs.nix-on-droid.lib.nixOnDroidConfiguration {
        extraSpecialArgs = {inherit inputs;};
        modules = [
          ./common.nix
          ./hosts/${name}.nix
          {environment.sessionVariables.HOSTNAME = "${name}";}

          {
            home-manager = {
              extraSpecialArgs = {
                inherit inputs' inputs self';
                osConfig = {};
              };
              sharedModules = [
                {nix.package = self'.packages.nix;}
                ../home/common.nix
                ../home/hosts/${name}.nix
              ];
            };
          }
        ];
      });
in {
  flake.nixOnDroidConfigurations = {
    ErrorNoPhone = mkSystem "ErrorNoPhone" "aarch64-linux";
  };
}
