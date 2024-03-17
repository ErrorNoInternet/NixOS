{
  config,
  lib,
  ...
}: let
  cfg = config.caches.errornobinaries;
  inherit (lib) mkEnableOption mkIf mkOrder optionals;

  values = (import ./values.nix).errornobinaries;
in {
  options.caches.errornobinaries = {
    enable = mkEnableOption "" // {default = true;};
    internal = mkEnableOption "" // {default = true;};
    external = mkEnableOption "" // {default = false;};
    cachix = mkEnableOption "" // {default = true;};
  };

  config = mkIf cfg.enable {
    nix.settings = {
      substituters = with cfg;
        mkOrder 500 (
          (optionals internal values.substituters.internal)
          ++ (optionals external values.substituters.external)
          ++ (optionals cachix values.substituters.cachix)
        );
      trusted-public-keys = values.publicKeys;
    };
  };
}
