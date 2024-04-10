{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.workstation.sddm;
  inherit (lib) mkEnableOption mkIf;
in {
  options.workstation.sddm.enable = mkEnableOption "";

  config = mkIf cfg.enable {
    services.xserver.displayManager.sddm = {
      enable = true;
      theme = "${pkgs.sddmTheme-corners}";
    };

    environment.systemPackages = [pkgs.libsForQt5.qt5.qtgraphicaleffects];
  };
}
