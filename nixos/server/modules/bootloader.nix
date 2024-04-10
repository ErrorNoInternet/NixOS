{
  config,
  lib,
  ...
}: let
  cfg = config.server.bootloader;
  inherit (lib) mkEnableOption mkIf;
in {
  options.server.bootloader.enable = mkEnableOption "";

  config = mkIf cfg.enable {
    boot.loader.grub = {
      enable = true;
      efiSupport = true;
      efiInstallAsRemovable = true;
      device = "nodev";
      splashImage = null;

      configurationLimit = 100;
    };
  };
}
