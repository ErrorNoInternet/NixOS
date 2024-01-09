{
  config,
  lib,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
in {
  options.profiles.androidDevelopment.enable =
    mkEnableOption ""
    // {
      default = true;
    };

  config = mkIf config.profiles.androidDevelopment.enable {
    programs.adb.enable = true;
    users.users.ryan.extraGroups = ["adbusers"];
  };
}
