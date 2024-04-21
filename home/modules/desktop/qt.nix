{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.toolkits.qt;
  inherit (lib) mkEnableOption mkOption mkIf types;
in {
  options.toolkits.qt = {
    enable = mkEnableOption "";

    theme = mkOption {
      type = with types;
        submodule {
          options = {
            name = mkOption {type = str;};
            packageName = mkOption {type = str;};
            package = mkOption {type = package;};
          };
        };
      default = {
        name = "Nordic-Darker";
        packageName = "Nordic-Darker";
        package = pkgs.nordic;
      };
    };
  };

  config = mkIf cfg.enable {
    qt = {
      enable = true;
      platformTheme.name = "qtct";
      style.name = "kvantum";
    };

    xdg.configFile = with cfg.theme; {
      "Kvantum/kvantum.kvconfig".text = ''
        [General]
        theme=${name}
      '';
      "Kvantum/${packageName}".source = "${package}/share/Kvantum/${packageName}";
    };
  };
}
