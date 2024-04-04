{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.customPrograms.fish.enable {
    programs.bat = {
      enable = true;
      config.theme = config.colors.schemeName;
    };
  };
}
