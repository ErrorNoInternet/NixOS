{ config, lib, ... }:
let
  cfg = config.profiles.gaming;
  inherit (lib) mkEnableOption mkIf;
in
{
  options.profiles.gaming = {
    enable = mkEnableOption "" // {
      default = true;
    };

    enableSteam = mkEnableOption "" // {
      default = true;
    };
  };

  config = mkIf cfg.enable {
    caches.nix-gaming.enable = true;

    programs.steam = {
      enable = cfg.enableSteam;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
  };
}
