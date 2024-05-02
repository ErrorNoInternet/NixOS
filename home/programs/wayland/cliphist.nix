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

      extraOptions = [
        "-max-items"
        "1000"
        "-max-dedupe-search"
        "10"
      ];
    };
  };
}
