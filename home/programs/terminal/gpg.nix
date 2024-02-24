{
  config,
  lib,
  ...
}: let
  cfg = config.customPrograms.terminal.gpg;
  inherit (lib) mkEnableOption mkIf;
in {
  options.customPrograms.terminal.gpg.enable = mkEnableOption "";

  config = mkIf cfg.enable {
    programs.gpg = {
      enable = true;
      settings = {
        keyserver = "hkps://keyserver.ubuntu.com";
        default-key = "2486BFB7B1E6A4A3";
      };
    };
    services.gpg-agent = {
      enable = true;
      enableFishIntegration = true;

      verbose = true;
      pinentryFlavor = "curses";
      defaultCacheTtl = 86400;
      maxCacheTtl = 86400;
    };
    home.file.".gnupg/dirmngr.conf".text = ''
      standard-resolver
    '';
  };
}
