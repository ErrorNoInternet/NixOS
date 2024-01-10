{
  config,
  lib,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
in {
  options.home.programs.graphical.thunderbird.enable = mkEnableOption "";

  config = mkIf config.home.programs.graphical.thunderbird.enable {
    programs.thunderbird = {
      enable = true;
      profiles = {
        "A Profile" = {
          isDefault = true;
        };
      };
      settings = {
        "msgcompose.font_face" = "monospace";
        "privacy.donottrackheader.enabled" = true;
      };
    };
  };
}
