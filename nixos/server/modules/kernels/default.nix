{
  config,
  lib,
  pkgs,
  self,
  ...
}: let
  inherit (lib) mkOption;
in {
  options.server.kernel.packages = mkOption {
    default = import ./packages.nix {inherit config lib pkgs self;};
  };
}
