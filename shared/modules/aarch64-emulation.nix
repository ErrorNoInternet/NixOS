{
  config,
  lib,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
in {
  options.shared.modules.emulation = {
    enable =
      mkEnableOption ""
      // {
        default = true;
      };

    linux = {
      aarch64 =
        mkEnableOption ""
        // {
          default = true;
        };
    };
  };

  config = mkIf config.shared.modules.emulation.enable {
    boot.binfmt.emulatedSystems = with config.shared.modules.emulation; [
      (mkIf linux.aarch64 "aarch64-linux")
    ];
  };
}
