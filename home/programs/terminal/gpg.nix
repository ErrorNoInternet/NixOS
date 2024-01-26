{
  config,
  lib,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
in {
  options.home.programs.terminal.gpg.enable = mkEnableOption "";

  config = mkIf config.home.programs.terminal.gpg.enable {
    programs.gpg = {
      enable = true;
      settings = {
        keyserver = "hkps://keys.openpgp.org";
        default-key = "2486BFB7B1E6A4A3";
      };
    };
    services.gpg-agent = {
      enable = true;
      enableFishIntegration = true;

      verbose = true;
      pinentryFlavor = "curses";
      defaultCacheTtl = 86400;
      maxCacheTtl = 86400 * 3;
    };
  };
}
