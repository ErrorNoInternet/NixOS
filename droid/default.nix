{inputs, ...}: let
  mkSystem = name:
    inputs.nix-on-droid.lib.nixOnDroidConfiguration {
      extraSpecialArgs = {inherit inputs;};
      modules = [
        ./common.nix
      ];
    };
in {
  flake.nixOnDroidConfigurations = {
    ErrorNoPhone = mkSystem "ErrorNoPhone";
  };
}
