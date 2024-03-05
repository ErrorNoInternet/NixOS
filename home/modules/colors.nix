{
  config,
  inputs,
  lib,
  ...
}:
let
  inherit (lib) mkOption types;
in
{
  imports = [ inputs.nix-colors.homeManagerModules.default ];

  options.colors = {
    scheme = mkOption { default = inputs.nix-colors.colorSchemes.nord; };

    schemeName = mkOption {
      default = "Nord";
      type = types.str;
    };
  };

  config.colorScheme = config.colors.scheme;
}
