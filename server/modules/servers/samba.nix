{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
in {
  options.server.modules.servers.samba.enable = mkEnableOption "";

  config = mkIf config.server.modules.servers.samba.enable {
    networking.firewall.allowedTCPPorts = [
      # wsdd
      5357
    ];
    networking.firewall.allowedUDPPorts = [
      # wsdd
      3702
    ];

    services = {
      samba-wsdd.enable = true;
      samba = {
        package = pkgs.sambaFull;
        enable = true;
        openFirewall = true;
        extraConfig = ''
          create mask = 644
          directory mask = 755
          map to guest = bad user

          force group = users
          force user = snowflake
          valid users = snowflake
          workgroup = WORKGROUP

          load printers = yes
          printing = cups
          printcap name = cups
        '';
      };
    };
  };
}
