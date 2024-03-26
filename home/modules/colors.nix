{
  config,
  inputs,
  lib,
  ...
}: let
  cfg = config.colors;
  inherit (lib) mkOption types;
in {
  imports = [inputs.nix-colors.homeManagerModules.default];

  options.colors = {
    scheme = mkOption {
      default = inputs.nix-colors.colorSchemes.nord;
    };

    schemeName = mkOption {
      type = types.str;
      default = "Nord";
    };
  };

  config.colorScheme = cfg.scheme;
}
