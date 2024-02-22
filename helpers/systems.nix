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
          ++ lib.optionals homeManager [
            inputs.home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = {inherit inputs' inputs self' self;};

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

  mkHmServer = name: system:
    mkSystem {
      type = "server";
      homeManager = true;
      inherit name system;
    };

  mkServer = name: system:
    mkSystem {
      type = "server";
      homeManager = false;
      inherit name system;
    };

  mkHmWorkstation = name: system:
    mkSystem {
      type = "workstation";
      homeManager = true;
      inherit name system;
    };

  mkWorkstation = name: system:
    mkSystem {
      type = "workstation";
      homeManager = false;
      inherit name system;
    };

  mkSpecialisation = name: configuration:
    {inherit configuration;}
    // {configuration.environment.etc.specialisation.text = name;};
}
