{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.home.programs.terminal.fish.enable {
    programs.zoxide = {
      enable = true;
      enableFishIntegration = true;
    };
  };
}
