{
  config,
  lib,
  ...
}: let
  inherit (lib) mkOverride mkDefault;
in {
  boot = {
    kernelPackages =
      mkOverride 1250 config.workstation.kernel.packages.default;

    supportedFilesystems = ["ntfs"];

    kernel.sysctl = {
      "kernel.sysrq" = mkDefault 1;
    };
  };
}
