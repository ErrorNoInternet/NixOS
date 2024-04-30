{lib, ...}: let
  inherit (lib) mkDefault;
in {
  boot = {
    supportedFilesystems = ["ntfs"];

    kernel.sysctl = {
      "kernel.sysrq" = mkDefault 1;
    };
  };
}
