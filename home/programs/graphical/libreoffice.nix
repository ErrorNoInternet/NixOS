{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
in {
  options.home.programs.graphical.libreoffice.enable = mkEnableOption "";

  config = mkIf config.home.programs.graphical.libreoffice.enable {
    home.packages = with pkgs; [
      libreoffice-qt
      hunspell
      hunspellDicts.en_US
    ];
  };
}
