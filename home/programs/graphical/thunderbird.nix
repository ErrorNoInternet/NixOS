{ config, lib, ... }:
let
  inherit (lib) mkEnableOption mkIf;
in
{
  options.customPrograms.graphical.thunderbird.enable = mkEnableOption "";

  config = mkIf config.customPrograms.graphical.thunderbird.enable {
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
