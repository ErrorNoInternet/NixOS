{
  config,
  lib,
  self,
  ...
}:
let
  cfg = config.profiles.locations.china;
  inherit (lib) mkEnableOption mkIf;
  values = (import "${self}/shared/caches/values.nix").locations.china;
in
{
  options.profiles.locations.china.enable = mkEnableOption "" // {
    default = true;
  };

  config = mkIf cfg.enable {
    nix.settings = {
      inherit (values) substituters;
      trusted-public-keys = values.publicKeys;
    };
  };
}
