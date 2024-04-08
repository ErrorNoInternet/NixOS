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
      specialArgs = {
        inherit inputs' inputs self' self system;
        osConfig = {};
      };
    in
      inputs.nix-on-droid.lib.nixOnDroidConfiguration {
        extraSpecialArgs = specialArgs;

        modules = [
          ../shared/modules
          ../shared/system
          ./common.nix
          ./hosts/${name}.nix
          {environment.sessionVariables.HOSTNAME = name;}

          {
            home-manager = {
              extraSpecialArgs = specialArgs;

              sharedModules = [
                ({config, ...}: {nix.package = config.pkgsSelf.nix;})
                ../home/common.nix
                ../home/hosts/${name}.nix
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
