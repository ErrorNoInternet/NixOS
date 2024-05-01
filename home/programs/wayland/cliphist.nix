{
  config,
  lib,
  ...
}: let
  cfg = config.customPrograms.cliphist;
  inherit (lib) mkEnableOption mkIf;
in {
  options.customPrograms.cliphist.enable =
    mkEnableOption "" // {default = config.profiles.windowManager.enable;};

  config = mkIf cfg.enable {
    services.cliphist = {
      enable = true;

      maxDedupeSearch = 10;
      maxItems = 1000;
    };
  };
}
