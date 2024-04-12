{
  config,
  lib,
  ...
}: let
  cfg = config.caches.numtide;
  inherit (lib) mkEnableOption mkIf;
in {
  options.caches.numtide.enable = mkEnableOption "";

  config = mkIf cfg.enable {
    nix.settings = {
      substituters = [
        "https://numtide.cachix.org"
      ];
      trusted-public-keys = [
        "numtide.cachix.org-1:2ps1kLBUWjxIneOy1Ik6cQjb41X0iXVXeHigGmycPPE="
      ];
    };
  };
}
