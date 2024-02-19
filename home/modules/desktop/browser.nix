{
  config,
  lib,
  ...
}: let
  inherit (lib) mkOption types;
in {
  options.browser.name = mkOption {
    default = "firefox";
    type = types.str;
  };

  config.home.sessionVariables.BROWSER = config.browser.name;
}
