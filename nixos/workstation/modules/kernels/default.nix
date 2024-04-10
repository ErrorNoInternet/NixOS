{
  config,
  lib,
  pkgs,
  self,
  ...
}: let
  inherit (lib) mkOption;
in {
  options.workstation.pkgsKernels = mkOption {
    default = import ./packages.nix {inherit config lib pkgs self;};
  };
}
