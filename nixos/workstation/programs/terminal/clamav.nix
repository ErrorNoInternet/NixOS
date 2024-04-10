{
  config,
  lib,
  ...
}: let
  cfg = config.workstation.programs.clamav;
  inherit (lib) mkEnableOption mkIf;
in {
  options.workstation.programs.clamav.enable =
    mkEnableOption "" // {default = true;};

  config = mkIf cfg.enable {
    services.clamav.updater = {
      enable = true;
      interval = "*-1/3";
    };
  };
}
