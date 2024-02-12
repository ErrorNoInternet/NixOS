{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.profiles.locations.china;
  inherit (lib) mkEnableOption mkIf;
  values = (import ../../../shared/caches/values.nix).locations.china;
in {
  options.profiles.locations.china.enable =
    mkEnableOption ""
    // {
      default = true;
    };

  config = mkIf cfg.enable {
    time.timeZone = "Asia/Shanghai";
    nix.settings.substituters = values.substituters;
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
