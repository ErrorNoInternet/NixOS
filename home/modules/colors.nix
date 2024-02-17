{
  config,
  inputs,
  lib,
  ...
}: let
  inherit (lib) mkOption;
in {
  imports = [inputs.nix-colors.homeManagerModules.default];

  options.colors.scheme = mkOption {
    default = inputs.nix-colors.colorSchemes.catppuccin-mocha;
  };

  config.colorScheme = config.colors.scheme;
}
