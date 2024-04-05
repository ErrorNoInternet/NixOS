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
            ../${type}/common.nix
            ../${type}/hosts/${name}
            ../${type}/hosts/${name}/hardware.nix
            ../packages/module.nix
            ../shared/all.nix
            ../shared/nixos.nix
            {
              host = {inherit name id system;};
              inherit username;
            }
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
