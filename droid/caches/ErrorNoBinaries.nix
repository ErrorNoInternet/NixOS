{
  config,
  lib,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
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

  config = mkIf config.caches.ErrorNoBinaries.enable {
    nix = let
      shared = import ../../shared/caches/ErrorNoBinaries.nix;
    in {
      substituters = with config.caches.ErrorNoBinaries; [
        (mkIf internal shared.substituters.internal)
        (mkIf external shared.substituters.external)
        (mkIf cachix shared.substituters.cachix)
      ];
      trustedPublicKeys = shared.publicKeys;
    };
  };
}
