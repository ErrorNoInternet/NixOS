{
  config,
  lib,
  ...
}: let
  cfg = config.customPrograms.thunderbird;
  inherit (lib) mkEnableOption mkIf;
in {
  options.customPrograms.thunderbird.enable = mkEnableOption "";

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
