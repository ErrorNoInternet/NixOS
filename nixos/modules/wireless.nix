{
  config,
  lib,
  self,
  ...
}: let
  cfg = config.nixos.wireless;
  inherit (lib) mkEnableOption mkIf;
in {
  options.nixos.wireless.enable = mkEnableOption "";

  config = mkIf cfg.enable {
    age.secrets.wireless-networks.file = "${self}/secrets/wireless-networks.age";

    networking.wireless = {
      enable = true;
      userControlled.enable = true;
      environmentFile = config.age.secrets.wireless-networks.path;

      networks = builtins.listToAttrs (builtins.genList (n: {
          name = "@ssid${builtins.toString n}@";
          value.psk = "@psk${builtins.toString n}@";
        })
        5);
    };
  };
}
