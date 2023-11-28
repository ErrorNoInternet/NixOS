{inputs, ...}: let
  defaultModule = {
    imports = [
      ./caches/ErrorNoBinaries.nix
      ./common.nix
      ./locations/china.nix
    ];
  };
  inherit (inputs.nixpkgs.lib) nixOnDroidConfiguration;
in {
  flake.nixOnDroidConfigurations = {
    ErrorNoPhone = nixOnDroidConfiguration {
      extraSpecialArgs = {inherit inputs;};
      modules = [
        defaultModule
        ./hosts/ErrorNoPhone.nix
      ];
    };
  };
}
