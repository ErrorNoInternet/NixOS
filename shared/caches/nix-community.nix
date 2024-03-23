{
  config,
  lib,
  ...
}: let
  cfg = config.caches.nix-community;
  inherit (lib) mkEnableOption mkIf;
in {
  options.caches.nix-community.enable =
    mkEnableOption "" // {default = true;};

  config = mkIf cfg.enable {
    nix.settings = {
      substituters = [
        "https://nix-community.cachix.org"
      ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
    };
  };
}
