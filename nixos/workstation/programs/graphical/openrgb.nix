{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.workstation.programs.openrgb;
  inherit (lib) mkEnableOption mkIf;
in {
  options.workstation.programs.openrgb = {
    enable = mkEnableOption "" // {default = true;};

    forceLibusb = mkEnableOption "" // {default = true;};
  };

  config = mkIf cfg.enable {
    boot.kernelModules = ["i2c-dev" "i2c-piix4"];

    environment.systemPackages = with pkgs; [
      (
        if cfg.forceLibusb
        then openrgb-libusb
        else (openrgb.withPlugins [openrgb-plugin-effects])
      )
    ];
  };
}
