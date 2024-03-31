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
    homeManager ? true,
    name,
    system ? "x86_64-linux",
    disko ? true,
  }:
    withSystem system ({
      inputs',
      self',
      ...
    }: let
      specialArgs = {
        inherit inputs' inputs self' self system;
      };
    in
      inputs.nixpkgs.lib.nixosSystem {
        inherit specialArgs;

        modules = let
          isWorkstation = type == "workstation";
        in
          [
            ../${type}/common.nix
            ../${type}/hosts/${name}
            ../${type}/hosts/${name}/hardware.nix
            ../packages/module.nix
            ../shared/all.nix
            ../shared/nixos.nix
            {host = {inherit name system;};}
          ]
          ++ optionals disko [
            ../${type}/hosts/${name}/disko.nix
            inputs.disko.nixosModules.disko
          ]
          ++ optionals homeManager [
            {
              home-manager = {
                extraSpecialArgs = specialArgs;

                backupFileExtension = "nixbak";
                useGlobalPkgs = true;
                useUserPackages = true;

                users.${
                  if isWorkstation
                  then "error"
                  else "snowflake"
                } = {...}: {
                  imports = [
                    ../home/common.nix
                    ../home/hosts/${name}.nix
                  ];

                  flags = {inherit isWorkstation;};
                };
              };
            }
            inputs.home-manager.nixosModules.home-manager
          ];
      });

  mkHmServer = name: extraConfig:
    mkSystem ({
        type = "server";
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
        inherit name;
      }
      // extraConfig);
}
