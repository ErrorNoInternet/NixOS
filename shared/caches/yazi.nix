{ config, lib, ... }:
let
  cfg = config.caches.yazi;
  inherit (lib) mkEnableOption mkIf;
in
{
  options.caches.yazi.enable = mkEnableOption "" // {
    default = true;
  };

  config = mkIf cfg.enable {
    nix.settings = {
      substituters = [ "https://yazi.cachix.org" ];
      trusted-public-keys = [ "yazi.cachix.org-1:Dcdz63NZKfvUCbDGngQDAZq6kOroIrFoyO064uvLh8k=" ];
    };
  };
}
