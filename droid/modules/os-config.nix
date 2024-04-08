{
  config,
  lib,
  ...
}: let
  inherit (lib) mkOption;
in {
  options.osConfig = mkOption {
    default = config;
    readOnly = true;
  };
}
