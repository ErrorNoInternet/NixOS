{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
in {
  options.profiles.minecraftServer.enable = mkEnableOption "";

  config = mkIf config.profiles.minecraftServer.enable {
    networking.firewall.allowedTCPPorts = [25565];
    environment.systemPackages = with pkgs; [
      jdk17
    ];
  };
}
