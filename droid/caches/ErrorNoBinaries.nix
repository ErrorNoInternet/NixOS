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
    nix = {
      substituters = with config.caches.ErrorNoBinaries; [
        (mkIf internal (import ../../shared/caches/ErrorNoBinaries.nix).substituters.internal)
        (mkIf external (import ../../shared/caches/ErrorNoBinaries.nix).substituters.external)
        (mkIf cachix (import ../../shared/caches/ErrorNoBinaries.nix).substituters.cachix)
      ];
      trustedPublicKeys = (import ../../shared/caches/ErrorNoBinaries.nix).publicKeys;
    };
  };
}
