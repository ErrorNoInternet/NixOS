{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.customPrograms.graphical.libreoffice;
  inherit (lib) mkEnableOption mkIf;
in {
  options.customPrograms.graphical.libreoffice.enable =
    mkEnableOption "";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      libreoffice-qt
      hunspell
      hunspellDicts.en_US
    ];
  };
}
