{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.server.services.minecraft;
  inherit (lib) mkEnableOption mkIf;
in {
  options.server.services.minecraft.enable = mkEnableOption "";

  config = mkIf cfg.enable {
    networking.firewall.allowedTCPPorts = [25565];

    environment.systemPackages = with pkgs; [
      jdk17
    ];
  };
}
