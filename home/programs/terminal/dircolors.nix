{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.customPrograms.fish.enable {
    programs.dircolors = {
      enable = true;
      enableFishIntegration = true;
    };
  };
}
