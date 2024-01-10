{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkEnableOption mkIf optional;
in {
  options.workstation.programs.openrgb = {
    enable =
      mkEnableOption ""
      // {
        default = true;
      };

    enablePatches =
      mkEnableOption ""
      // {
        default = true;
      };
  };

  config = mkIf config.workstation.programs.openrgb.enable {
    boot.kernelModules = ["i2c-dev" "i2c-piix4"];
    environment.systemPackages = with pkgs; [
      ((openrgb.withPlugins [openrgb-plugin-effects]).overrideAttrs
        (oldAttrs: {
          patches =
            (oldAttrs.patches or [])
            ++ optional (config.workstation.programs.openrgb.enablePatches != null) [
              ../../../packages/patches/openrgb_force-libusb.patch
            ];
        }))
    ];
  };
}
