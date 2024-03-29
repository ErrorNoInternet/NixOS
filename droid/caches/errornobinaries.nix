{
  config,
  lib,
  self,
  ...
}: let
  cfg = config.caches.errornobinaries;
  inherit (lib) mkEnableOption mkIf optionals;

  values = (import "${self}/shared/caches/values.nix").errornobinaries;
in {
  options.caches.errornobinaries = {
    enable = mkEnableOption "" // {default = true;};
    internal = mkEnableOption "" // {default = true;};
    external = mkEnableOption "" // {default = true;};
    cachix = mkEnableOption "" // {default = true;};
  };

  config = mkIf cfg.enable {
    nix = {
      substituters = with cfg;
        (optionals internal values.substituters.internal)
        ++ (optionals external values.substituters.external)
        ++ (optionals cachix values.substituters.cachix);
      trustedPublicKeys = values.publicKeys;
    };
  };
}
