{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.customPrograms.terminal.fish.enable {
    programs.zoxide = {
      enable = true;
      enableFishIntegration = true;
    };
  };
}
