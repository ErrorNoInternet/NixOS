{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.customPrograms.fish.enable {
    programs.zoxide = {
      enable = true;
      enableFishIntegration = true;
    };
  };
}
