{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
in {
  options.server.printing.enable = mkEnableOption "";

  config = mkIf config.server.printing.enable {
    services.printing = {
      enable = true;
      drivers = [pkgs.hplip];
    };
  };
}
