{
  config,
  lib,
  pkgs,
  self,
  ...
}: let
  cfg = config.workstation.kernel;
  inherit (lib) mkOverride mkOption types;
in {
  imports = [
    ./common.nix
    ./patches
  ];

  options.workstation.kernel = {
    availablePackages = mkOption {
      default = import ./packages.nix {
        inherit config lib pkgs self;
      };
    };

    packages = mkOption {
      default =
        mkOverride 1250 cfg.availablePackages.default;
    };

    patches = {
      removeUnused = mkOption {
        default = true;
        type = types.bool;
      };
    };

    version = mkOption {
      default =
        cfg.packages.content.kernel.version
        or cfg.packages.kernel.version;
    };
  };

  config.boot.kernelPackages = cfg.packages;
}
