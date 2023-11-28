{inputs, ...}: let
  defaultModule = {
    imports = [
      ./caches/ErrorNoBinaries.nix
      ./common.nix
      ./locations/china.nix
    ];
  };
in {
  flake.nixOnDroidConfigurations = let
    inherit (inputs.nixpkgs.lib) nixOnDroidConfiguration;
  in {
    ErrorNoPhone = nixOnDroidConfiguration {
      extraSpecialArgs = {inherit inputs;};
      modules = [
        defaultModule
        ./hosts/ErrorNoPhone.nix
      ];
    };
  };
}
