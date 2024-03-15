{
  config,
  lib,
  ...
}: let
  cfg = config.profiles.gaming;
  inherit (lib) mkEnableOption mkIf;
in {
  options.profiles.gaming.enable =
    mkEnableOption "" // {default = true;};

  config = mkIf cfg.enable {
    nixpkgs.config.allowUnfree = true;

    caches.nix-gaming.enable = true;

    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
  };
}
