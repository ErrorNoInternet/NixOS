{
  config,
  lib,
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
    nix.substituters = [
      "https://mirror.sjtu.edu.cn/nix-channels/store"
    ];
    time.timeZone = "Asia/Shanghai";
    networking.extraHosts = ''
      185.199.111.133 raw.githubusercontent.com
    '';
  };
}
