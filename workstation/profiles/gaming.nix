{
  config,
  lib,
  ...
}: let
  cfg = config.profiles.gaming;
  inherit (lib) mkEnableOption mkIf;
in {
  options.profiles.gaming = {
    enable =
      mkEnableOption ""
      // {
        default = true;
      };

    enableSteam =
      mkEnableOption ""
      // {
        default = true;
      };
  };

  config = mkIf cfg.enable {
    nixpkgs.config.allowUnfree = true;

    caches.nix-gaming.enable = true;

    programs.steam = {
      enable = cfg.enableSteam;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
  };
}
