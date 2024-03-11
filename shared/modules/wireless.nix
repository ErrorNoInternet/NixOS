{
  config,
  lib,
  self,
  ...
}: let
  cfg = config.shared.modules.wireless;
  inherit (lib) mkEnableOption mkIf;
in {
  options.shared.modules.wireless.enable = mkEnableOption "";

  config = mkIf cfg.enable {
    age.secrets.wireless-networks.file = "${self}/secrets/wireless-networks.age";
    networking.wireless = {
      enable = true;

      environmentFile = config.age.secrets.wireless-networks.path;
      networks = {
        "@ssid1@".psk = "@psk1@";
        "@ssid2@".psk = "@psk2@";
      };
    };
  };
}
