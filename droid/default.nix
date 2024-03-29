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
    }: let
      specialArgs = {inherit inputs' inputs self' self system;};
    in
      inputs.nix-on-droid.lib.nixOnDroidConfiguration {
        extraSpecialArgs = specialArgs;

        modules = [
          ../packages/module.nix
          ./common.nix
          ./hosts/${name}.nix
          {environment.sessionVariables.HOSTNAME = name;}

          {
            home-manager = {
              extraSpecialArgs = specialArgs // {osConfig = {};};

              sharedModules = [
                ({config, ...}: {nix.package = config.pkgsSelf.nix;})
                ../home/common.nix
                ../home/hosts/${name}.nix
                ../packages/module.nix
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
