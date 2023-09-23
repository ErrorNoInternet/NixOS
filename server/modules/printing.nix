{ config, pkgs, ... }:

{
    networking.firewall.allowedTCPPorts = [ 631 ];
    services.printing = {
        enable = true;
        drivers = [ pkgs.hplip ];
    };
}
