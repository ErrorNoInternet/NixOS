{
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
}
