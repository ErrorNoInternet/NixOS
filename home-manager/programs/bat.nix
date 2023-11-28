{custom, ...}: {
  programs.bat = {
    enable = true;
    config = {
      theme = "${custom.predefinedColorScheme}";
    };
  };
}
