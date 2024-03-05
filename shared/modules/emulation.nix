{ config, lib, ... }:
let
  cfg = config.shared.modules.emulation;
  inherit (lib) mkEnableOption mkIf optional;
in
{
  options.shared.modules.emulation = {
    enable = mkEnableOption "" // {
      default = true;
    };

    linux = {
      aarch64 = mkEnableOption "" // {
        default = config.host.system != "aarch64-linux";
      };
    };
  };

  config = mkIf cfg.enable {
    boot.binfmt.emulatedSystems = with cfg; (optional linux.aarch64 "aarch64-linux");
  };
}
