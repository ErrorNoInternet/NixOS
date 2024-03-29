{
  config,
  lib,
  ...
}: let
  cfg = config.customPrograms.graphical.thunderbird;
  inherit (lib) mkEnableOption mkIf;
in {
  options.customPrograms.graphical.thunderbird.enable = mkEnableOption "";

  config = mkIf cfg.enable {
    programs.thunderbird = {
      enable = true;

      profiles."A Profile" = {isDefault = true;};
      settings = {
        "msgcompose.font_face" = "monospace";
        "privacy.donottrackheader.enabled" = true;
      };
    };
  };
}
