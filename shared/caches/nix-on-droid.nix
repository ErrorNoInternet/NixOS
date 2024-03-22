{
  config,
  lib,
  ...
}: let
  cfg = config.caches.nix-on-droid;
  inherit (lib) mkEnableOption mkIf;
in {
  options.caches.nix-on-droid.enable =
    mkEnableOption "" // {default = config.flags.nixOnDroid or false;};

  config = mkIf cfg.enable {
    nix.settings = {
      substituters = [
        "https://cache.nix-on-droid.io"
      ];
      trusted-public-keys = [
        "nix-on-droid.cachix.org-1:56snoMJTXmDRC1Ei24CmKoUqvHJ9XCp+nidK7qkMQrU="
      ];
    };
  };
}
