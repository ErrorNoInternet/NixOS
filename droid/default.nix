{
  inputs,
  self,
  withSystem,
  ...
}: let
  mkDroid' = {
    name,
    system ? "aarch64-linux",
  }:
    withSystem system ({
      inputs',
      self',
      ...
    }:
      inputs.nix-on-droid.lib.nixOnDroidConfiguration {
        extraSpecialArgs = {inherit inputs' inputs self' self;};

        modules = [
          ./common.nix
          ./hosts/${name}.nix
          {environment.sessionVariables.HOSTNAME = name;}

          {
            home-manager = {
              extraSpecialArgs = {
                inherit inputs' inputs self' self;
                osConfig = {};
              };

              sharedModules = [
                ../home/common.nix
                ../home/hosts/${name}.nix
                {nix.package = self'.packages.nix;}
              ];
            };
          }
        ];
      });

  mkDroid = name:
    mkDroid' {inherit name;};
in {
  flake.nixOnDroidConfigurations = {
    ErrorNoPhone = mkDroid "ErrorNoPhone";
  };
}
