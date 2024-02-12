{
  config,
  lib,
  ...
}: let
  cfg = config.caches.ErrorNoBinaries;
  inherit (lib) mkEnableOption mkIf;
  values = (import ../../shared/caches/values.nix).ErrorNoBinaries;
in {
  options.caches.ErrorNoBinaries = {
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
        default = true;
      };
    cachix =
      mkEnableOption ""
      // {
        default = true;
      };
  };

  config = mkIf cfg.enable {
    nix = {
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
      trustedPublicKeys = values.publicKeys;
    };
  };
}
