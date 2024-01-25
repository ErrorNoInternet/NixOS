{
  config,
  lib,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
  values = (import ./values.nix).ErrorNoBinaries;
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
        default = false;
      };
    cachix =
      mkEnableOption ""
      // {
        default = true;
      };
  };

  config = mkIf config.caches.ErrorNoBinaries.enable {
    nix.settings = {
      substituters = with config.caches.ErrorNoBinaries; [
        (mkIf internal values.substituters.internal)
        (mkIf external values.substituters.external)
        (mkIf cachix values.substituters.cachix)
      ];
      trusted-public-keys = values.publicKeys;
    };
  };
}
