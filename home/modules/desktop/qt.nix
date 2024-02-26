{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.toolkits.qt;
  inherit (lib) mkEnableOption mkOption mkIf;
in {
  options.toolkits.qt = {
    enable = mkEnableOption "";

    theme = mkOption {
      default = {
        name = "Nordic-darker";
        packageName = "Nordic-darker";
        package = pkgs.nordic;
      };
    };
  };

  config = mkIf cfg.enable {
    qt = {
      enable = true;
      platformTheme = "qtct";
      style.name = "kvantum";
    };
    xdg.configFile = with cfg.theme; {
      "Kvantum/kvantum.kvconfig".text = ''
        [General]
        theme=${name}
      '';
      "Kvantum/${packageName}".source = "${package}/share/Kvantum/${packageName}";
    };
    home.sessionVariables.QT_FONT_DPI = "84";
  };
}
