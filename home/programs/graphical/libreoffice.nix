{
  config,
  lib,
  pkgs,
  ...
}:
let
  inherit (lib) mkEnableOption mkIf;
in
{
  options.customPrograms.graphical.libreoffice.enable = mkEnableOption "";

  config = mkIf config.customPrograms.graphical.libreoffice.enable {
    home.packages = with pkgs; [
      libreoffice-qt
      hunspell
      hunspellDicts.en_US
    ];
  };
}
