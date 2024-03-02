{
  inputs,
  lib,
  self,
  withSystem,
}: rec {
  mkSystem = {
    type,
    homeManager,
    name,
    system,
    allowUnfree ? false,
    cudaSupport ? false,
  }:
    withSystem system ({
      inputs',
      self',
      ...
    }:
      inputs.nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs' inputs self' self;};

        pkgs = import inputs.nixpkgs {
          inherit system;
          config = {inherit allowUnfree cudaSupport;};
        };

        modules =
          [
            ../${type}/common.nix
            ../${type}/hosts/${name}
            ../${type}/hosts/${name}/hardware.nix
            {host = {inherit name system;};}
          ]
          ++ lib.optionals homeManager [
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

  mkHmServer = name: system: extraConfig:
    mkSystem ({
        type = "server";
        homeManager = true;
        inherit name system;
      }
      // extraConfig);

  mkServer = name: system: extraConfig:
    mkSystem ({
        type = "server";
        homeManager = false;
        inherit name system;
      }
      // extraConfig);

  mkHmWorkstation = name: system: extraConfig:
    mkSystem ({
        type = "workstation";
        homeManager = true;
        inherit name system;
      }
      // extraConfig);

  mkWorkstation = name: system: extraConfig:
    mkSystem ({
        type = "workstation";
        homeManager = false;
        inherit name system;
      }
      // extraConfig);
}
