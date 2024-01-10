{
  config,
  inputs,
  lib,
  ...
}: {
  imports = [inputs.nix-colors.homeManagerModules.default];

  options = {
    colors = {
      scheme = lib.mkOption {
        default = inputs.nix-colors.colorSchemes.nord;
      };

      schemeName = lib.mkOption {
        default = "Nord";
        type = lib.types.str;
      };
    };
  };

  config = {
    colorScheme = config.colors.scheme;
  };
}
