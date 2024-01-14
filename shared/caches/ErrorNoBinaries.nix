{
  config,
  lib,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;

  substituters = {
    internal = "http://192.168.0.100:7454/ErrorNoBinaries";
    external = "https://errornointernet.dynv6.net:7455/ErrorNoBinaries";
    cachix = "https://errornobinaries.cachix.org";
  };
  publicKeys = [
    "ErrorNoBinaries:im2fJ1t41XAwp2S+DMgSI0VFKxS+jpz/XIOs/s9iLFg="
    "errornobinaries.cachix.org-1:84oagGNCIsXxBTYmfTiP+lvWje7lIS294iqAtCpFsbU="
  ];
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
    nix.settings = {
      substituters = with config.caches.ErrorNoBinaries; [
        (mkIf internal substituters.internal)
        (mkIf external substituters.external)
        (mkIf cachix substituters.cachix)
      ];
      trusted-public-keys = publicKeys;
    };
  };
}
