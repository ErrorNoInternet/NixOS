{
  config,
  lib,
  ...
}: {
  options.caches.ErrorNoBinaries = {
    enable = lib.mkEnableOption "";

    internal =
      lib.mkEnableOption ""
      // {
        default = true;
      };
    external =
      lib.mkEnableOption ""
      // {
        default = true;
      };
    cachix =
      lib.mkEnableOption ""
      // {
        default = true;
      };
  };

  config = lib.mkIf config.caches.ErrorNoBinaries.enable {
    nix.settings = {
      substituters = [
        (lib.mkIf config.caches.ErrorNoBinaries.internal "http://192.168.0.100:7454/ErrorNoBinaries")
        (lib.mkIf config.caches.ErrorNoBinaries.external "https://errornointernet.dynv6.net:7455/ErrorNoBinaries")
        (lib.mkIf config.caches.ErrorNoBinaries.cachix "https://errornobinaries.cachix.org")
      ];
      trusted-public-keys = [
        "ErrorNoBinaries:im2fJ1t41XAwp2S+DMgSI0VFKxS+jpz/XIOs/s9iLFg="
        "errornobinaries.cachix.org-1:84oagGNCIsXxBTYmfTiP+lvWje7lIS294iqAtCpFsbU="
      ];
    };
  };
}
