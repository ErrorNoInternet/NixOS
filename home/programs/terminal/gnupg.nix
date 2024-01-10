{
  config,
  lib,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
in {
  options.customPrograms.terminal.gpg.enable = mkEnableOption "";

  config = mkIf config.customPrograms.terminal.gpg.enable {
    programs.gpg = {
      enable = true;
      settings = {
        keyserver = "hkps://keys.openpgp.org";
        default-key = "2486BFB7B1E6A4A3";
      };
    };
  };
}
