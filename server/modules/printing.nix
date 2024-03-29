{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.server.printing;
  inherit (lib) mkEnableOption mkIf;
in {
  options.server.printing.enable = mkEnableOption "";

  config = mkIf cfg.enable {
    services.printing = {
      enable = true;
      drivers = [pkgs.hplip];
    };
  };
}
