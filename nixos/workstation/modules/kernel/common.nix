{lib, ...}: let
  inherit (lib) mkDefault;
in {
  boot = {
    supportedFilesystems = ["ntfs"];

    kernel.sysctl = {
      "kernel.sysrq" = mkDefault 1;

      "vm.dirty_background_ratio" = 15;
      "vm.dirty_ratio" = 25;
    };
  };
}
