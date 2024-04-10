{
  config,
  lib,
  ...
}: let
  cfg = config.profiles.androidDevelopment;
  inherit (lib) mkEnableOption mkIf;
in {
  options.profiles.androidDevelopment.enable =
    mkEnableOption "" // {default = true;};

  config = mkIf cfg.enable {
    programs.adb.enable = true;
    users.users.error.extraGroups = ["adbusers" "plugdev"];
  };
}
