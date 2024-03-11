{
  config,
  lib,
  self',
  ...
}: let
  cfg = config.workstation.modules.sddm;
  inherit (lib) mkEnableOption mkIf;
in {
  options.workstation.modules.sddm.enable = mkEnableOption "";

  config = mkIf cfg.enable {
    services.xserver.displayManager.sddm = {
      enable = true;
      theme = "${self'.packages.sddm-theme-corners}";
    };
  };
}
