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
          ../packages/pkgsSelf.nix
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
                ../packages/pkgsSelf.nix
                ({config, ...}: {nix.package = config.pkgsSelf.nix;})
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
