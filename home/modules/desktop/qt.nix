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
        name = "GraphiteNordDark";
        packageName = "GraphiteNord";
        package = pkgs.graphite-kde-theme;
      };
    };
  };

  config = mkIf cfg.enable {
    qt = {
      enable = true;
      platformTheme = "qtct";
      style.name = "kvantum";
    };
    xdg.configFile = {
      "Kvantum/kvantum.kvconfig".text = ''
        [General]
        theme=${cfg.theme.name}
      '';
      "Kvantum/${cfg.theme.packageName}".source = "${cfg.theme.package}/share/Kvantum/${cfg.theme.packageName}";
    };
  };
}
