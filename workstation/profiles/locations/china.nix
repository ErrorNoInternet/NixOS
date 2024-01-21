{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
in {
  options.profiles.locations.china.enable =
    mkEnableOption ""
    // {
      default = true;
    };

  config = mkIf config.profiles.locations.china.enable {
    time.timeZone = "Asia/Shanghai";
    nix.settings.substituters = [
      "https://mirror.sjtu.edu.cn/nix-channels/store"
    ];
    services.mullvad-vpn = {
      enable = true;
      package = pkgs.mullvad-vpn;
    };
    networking.extraHosts = ''
      185.199.111.133 raw.githubusercontent.com
      192.30.255.112  github.com
    '';
  };
}
