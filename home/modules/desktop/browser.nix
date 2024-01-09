{
  config,
  lib,
  ...
}: {
  options.browser.name = lib.mkOption {
    default = "firefox";
    type = lib.types.str;
  };

  config.home.sessionVariables.BROWSER = "${config.browser.name}";
}
