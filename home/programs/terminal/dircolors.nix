{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.customPrograms.terminal.fish.enable {
    programs.dircolors = {
      enable = true;
      enableFishIntegration = true;
    };
  };
}
