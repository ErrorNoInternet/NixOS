{
  config,
  lib,
  self,
  ...
}: let
  cfg = config.profiles.locations.china;
  inherit (lib) mkEnableOption mkIf;

  values = (import "${self}/shared/caches/values.nix").locations.china;
in {
  options.profiles.locations.china.enable =
    mkEnableOption "" // {default = true;};

  config = mkIf cfg.enable {
    nix.settings.substituters = values.substituters;

    time.timeZone = "Asia/Shanghai";

    networking.extraHosts = ''
      185.199.111.133 raw.githubusercontent.com
      192.30.255.112  github.com
    '';
  };
}
