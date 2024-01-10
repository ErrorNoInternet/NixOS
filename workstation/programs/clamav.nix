{
  config,
  lib,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
in {
  options.workstation.programs.clamav.enable =
    mkEnableOption ""
    // {
      default = true;
    };

  config = mkIf config.workstation.programs.clamav.enable {
    services.clamav.updater.enable = true;
  };
}
