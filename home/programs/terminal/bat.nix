{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.customPrograms.terminal.fish.enable {
    programs.bat = {
      enable = true;
      config.theme = config.colors.schemeName;
    };
  };
}
