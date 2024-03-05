{
  config,
  lib,
  pkgs,
  ...
}:
let
  inherit (lib) mkEnableOption mkIf;
in
{
  options.server.services.samba.enable = mkEnableOption "";

  config = mkIf config.server.services.samba.enable {
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
          log level = 1 winbind:5

          force group = users
          force user = snowflake
          map to guest = bad user
          valid users = snowflake
          workgroup = WORKGROUP

          browsable = yes
          create mask = 644
          directory mask = 755

          load printers = yes
          printing = cups
          printcap name = cups
        '';
      };
    };
  };
}
