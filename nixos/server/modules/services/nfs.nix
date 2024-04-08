{
  config,
  lib,
  ...
}: let
  cfg = config.server.services.nfs;
  inherit (lib) mkEnableOption mkIf;
in {
  options.server.services.nfs.enable = mkEnableOption "";

  config = mkIf cfg.enable {
    networking.firewall = {
      allowedTCPPorts = [111 2049 4000 4001 4002 20048];
      allowedUDPPorts = [111 2049 4000 4001 4002 20048];
    };

    services.nfs.server = {
      enable = true;
      lockdPort = 4001;
      mountdPort = 4002;
      statdPort = 4000;
    };
  };
}
