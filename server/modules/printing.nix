{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
in {
  options.server.modules.printing.enable = mkEnableOption "";

  config = mkIf config.server.modules.printing.enable {
    services.printing = {
      enable = true;
      drivers = [pkgs.hplip];
    };
  };
}
