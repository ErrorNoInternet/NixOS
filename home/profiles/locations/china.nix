{
  config,
  lib,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
in {
  options.profiles.locations.china = {
    enable = mkEnableOption "";
  };

  config = mkIf config.profiles.locations.china.enable {
    nix.settings = {
      substituters = ["https://mirror.sjtu.edu.cn/nix-channels/store"];
      trusted-public-keys = ["cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="];
    };
  };
}
