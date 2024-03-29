{
  config,
  osConfig ? {},
  inputs',
  inputs,
  lib,
  pkgs,
  self,
  system,
  ...
}: let
  inherit (lib) mkOption;
in {
  options.pkgsSelf = mkOption {
    default = import "${self}/packages" {
      inherit inputs inputs' pkgs self system;
      config.host = config.host or osConfig.host;
    };
  };
}
