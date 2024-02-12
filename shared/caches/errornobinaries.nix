{
  config,
  lib,
  ...
}: let
  cfg = config.caches.errornobinaries;
  inherit (lib) mkEnableOption mkIf;
  values = (import ./values.nix).errornobinaries;
in {
  options.caches.errornobinaries = {
    enable =
      mkEnableOption ""
      // {
        default = true;
      };

    internal =
      mkEnableOption ""
      // {
        default = true;
      };
    external =
      mkEnableOption ""
      // {
        default = false;
      };
    cachix =
      mkEnableOption ""
      // {
        default = true;
      };
  };

  config = mkIf cfg.enable {
    nix.settings = {
      substituters = with cfg;
        (
          if internal
          then values.substituters.internal
          else []
        )
        ++ (
          if external
          then values.substituters.external
          else []
        )
        ++ (
          if cachix
          then values.substituters.cachix
          else []
        );
      trusted-public-keys = values.publicKeys;
    };
  };
}
