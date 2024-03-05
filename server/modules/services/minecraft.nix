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
  options.server.services.minecraft.enable = mkEnableOption "";

  config = mkIf config.server.services.minecraft.enable {
    networking.firewall.allowedTCPPorts = [ 25565 ];
    environment.systemPackages = with pkgs; [ jdk17 ];
  };
}
