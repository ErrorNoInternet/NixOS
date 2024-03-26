{
  config,
  lib,
  ...
}: let
  cfg = config.browser;
  inherit (lib) mkOption types;
in {
  options.browser.name = mkOption {
    type = types.str;
    default = "firefox";
  };

  config.home.sessionVariables.BROWSER = cfg.name;
}
