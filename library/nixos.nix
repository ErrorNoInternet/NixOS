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
    name,
    id ? null,
    system ? "x86_64-linux",
    homeManager ? true,
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
          username =
            if isWorkstation
            then "error"
            else "snowflake";
        in
          [
            ../nixos/${type}/common.nix
            ../nixos/${type}/hosts/${name}
            ../nixos/${type}/hosts/${name}/hardware.nix
            ../nixos/common.nix
            ../shared/modules
            ../shared/system
            {
              host = {inherit name id;};
              inherit username;
            }
          ]
          ++ optionals disko [
            ../nixos/${type}/hosts/${name}/disko.nix
            inputs.disko.nixosModules.disko
          ]
          ++ optionals homeManager [
            {
              home-manager = {
                extraSpecialArgs = specialArgs;

                backupFileExtension = "nixbak";
                useGlobalPkgs = true;
                useUserPackages = true;

                users.${username} = _: {
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

  mkHmServer = name: id: extraConfig:
    mkSystem ({
        type = "server";
        inherit name id;
      }
      // extraConfig);

  mkServer = name: id: extraConfig:
    mkSystem ({
        type = "server";
        homeManager = false;
        inherit name id;
      }
      // extraConfig);

  mkWorkstation = name: id: extraConfig:
    mkSystem ({
        type = "workstation";
        inherit name id;
      }
      // extraConfig);
}
