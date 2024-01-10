{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
in {
  options.server.modules.servers.minecraft.enable = mkEnableOption "";

  config = mkIf config.server.modules.servers.minecraft.enable {
    networking.firewall.allowedTCPPorts = [25565];
    environment.systemPackages = with pkgs; [
      jdk17
    ];
  };
}
