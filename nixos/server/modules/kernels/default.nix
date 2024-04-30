{
  config,
  lib,
  pkgs,
  self,
  ...
}: let
  cfg = config.server.kernel;
  inherit (lib) mkOverride mkOption;
in {
  options.server.kernel = {
    availablePackages = mkOption {
      default = import ./packages.nix {
        inherit config lib pkgs self;
      };
    };

    packages = mkOption {
      default =
        mkOverride 1250 cfg.availablePackages.default;
    };
  };

  config.boot.kernelPackages = cfg.packages;
}
