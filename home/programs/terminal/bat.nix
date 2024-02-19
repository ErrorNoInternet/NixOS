{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.home.programs.terminal.fish.enable {
    programs.bat = {
      enable = true;
      config.theme = config.colors.schemeName;
    };
  };
}
