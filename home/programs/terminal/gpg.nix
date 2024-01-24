{
  config,
  lib,
  pkgs,
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
    home.file.".gnupg/gpg-agent.conf".text = ''
      default-cache-ttl 86400
      max-cache-ttl 86400
      pinentry-program ${pkgs.pinentry.curses}/bin/pinentry-curses
    '';
  };
}