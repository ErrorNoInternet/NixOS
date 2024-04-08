{
  config,
  lib,
  ...
}: let
  inherit (lib) mkOption;
in {
  home-manager.config.options.osConfig = mkOption {
    default = config;
    readOnly = true;
  };
}
