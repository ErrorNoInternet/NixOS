{
  config,
  lib,
  ...
}: let
  cfg = config.caches.nix-gaming;
  inherit (lib) mkEnableOption mkIf;
in {
  options.caches.nix-gaming.enable = mkEnableOption "";

  config = mkIf cfg.enable {
    nix.settings = {
      substituters = [
        "https://nix-gaming.cachix.org"
      ];
      trusted-public-keys = [
        "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
      ];
    };
  };
}
