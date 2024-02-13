{
  config,
  lib,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
in {
  options.server.bootloader.enable = mkEnableOption "";

  config = mkIf config.server.bootloader.enable {
    boot.loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 25;
        consoleMode = "max";
      };
      efi.canTouchEfiVariables = true;
    };
  };
}
