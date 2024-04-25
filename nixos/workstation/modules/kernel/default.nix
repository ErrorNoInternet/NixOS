{
  config,
  lib,
  pkgs,
  self,
  ...
}: let
  inherit (lib) mkOption types;
in {
  imports = [
    ./common.nix
    ./patches
  ];

  options.workstation.kernel = {
    packages = mkOption {
      default = import ./packages.nix {
        inherit config lib pkgs self;
      };
    };

    patches = {
      removeUnusedExtra = mkOption {
        default = true;
        type = types.bool;
      };
    };
  };
}
