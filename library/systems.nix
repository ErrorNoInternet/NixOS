{
  inputs,
  lib,
  self,
  withSystem,
}: let
  inherit (lib) optionals;
in rec {
  mkSystem = {
    type,
    homeManager,
    name,
    system ? "x86_64-linux",
    disko ? type == "workstation",
  }:
    withSystem system ({
      inputs',
      self',
      ...
    }:
      inputs.nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs' inputs self' self;};

        modules =
          [
            ../${type}/common.nix
            ../${type}/hosts/${name}
            ../${type}/hosts/${name}/hardware.nix
            {host = {inherit name system;};}
          ]
          ++ optionals disko [
            inputs.disko.nixosModules.disko
            ../${type}/hosts/${name}/disko.nix
          ]
          ++ optionals homeManager [
            inputs.home-manager.nixosModules.home-manager
            {
              home-manager = {
                extraSpecialArgs = {inherit inputs' inputs self' self;};

                useGlobalPkgs = true;
                useUserPackages = true;

                users."${
                  if type == "workstation"
                  then "error"
                  else "snowflake"
                }" = {...}: {
                  imports = [
                    ../home/common.nix
                    ../home/hosts/${name}.nix
                  ];
                };
              };
            }
          ];
      });

  mkHmServer = name: extraConfig:
    mkSystem ({
        type = "server";
        homeManager = true;
        inherit name;
      }
      // extraConfig);

  mkServer = name: extraConfig:
    mkSystem ({
        type = "server";
        homeManager = false;
        inherit name;
      }
      // extraConfig);

  mkWorkstation = name: extraConfig:
    mkSystem ({
        type = "workstation";
        homeManager = true;
        inherit name;
      }
      // extraConfig);
}
