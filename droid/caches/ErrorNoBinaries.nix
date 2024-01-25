{
  config,
  lib,
  ...
}: let
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

  config = mkIf config.caches.ErrorNoBinaries.enable {
    nix = {
      substituters = with config.caches.ErrorNoBinaries; [
        (mkIf internal values.substituters.internal)
        (mkIf external values.substituters.external)
        (mkIf cachix values.substituters.cachix)
      ];
      trustedPublicKeys = values.publicKeys;
    };
  };
}
