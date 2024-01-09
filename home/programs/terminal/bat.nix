{config, ...}: {
  programs.bat = {
    enable = true;
    config.theme = "${config.colors.schemeName}";
  };
}
