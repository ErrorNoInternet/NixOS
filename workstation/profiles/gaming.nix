{
  config,
  lib,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
in {
  options.profiles.gaming.enable =
    mkEnableOption ""
    // {
      default = true;
    };

  config = mkIf config.profiles.gaming.enable {
    caches.nix-gaming.enable = true;

    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
  };
}
