{
  inputs,
  self,
  withSystem,
  ...
}: rec {
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
          ../droid/common.nix
          ../droid/hosts/${name}.nix
          ../shared/system
          {environment.sessionVariables.HOSTNAME = name;}

          ({pkgs, ...}: {
            home-manager = {
              extraSpecialArgs = specialArgs;

              sharedModules = [
                ../home/common.nix
                ../home/hosts/${name}.nix
                {nix.package = pkgs.nix;}
              ];
            };
          })
        ];
      });

  mkDroid = name:
    mkDroid' {inherit name;};
}
