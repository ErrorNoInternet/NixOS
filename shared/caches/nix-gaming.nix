{
  config,
  lib,
  ...
}: {
  options.caches.nix-gaming.enable = lib.mkEnableOption "";

  config = lib.mkIf config.caches.nix-gaming.enable {
    nix.settings = {
      substituters = ["https://nix-gaming.cachix.org"];
      trusted-public-keys = ["nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="];
    };
  };
}
