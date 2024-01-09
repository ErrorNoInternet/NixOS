{
  inputs,
  self,
  ...
}: let
  mkSystem = name:
    inputs.nixpkgs.lib.nixosSystem {
      pkgs = import inputs.nixpkgs {
        system = "x86_64-linux";
        config.allowUnfree = true;
      };
      specialArgs = {inherit inputs self;};
      modules = [
        ./common.nix
        ./hosts/${name}
        {home-manager.users.ryan = import ../home/hosts/${name}.nix;}
      ];
    };
in {
  flake.nixosConfigurations = {
    NixBtw = mkSystem "NixBtw";
    Rescanix = mkSystem "Rescanix";
  };
}
