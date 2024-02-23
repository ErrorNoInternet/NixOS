{
  config,
  inputs',
  lib,
  ...
}: {
  imports = [
    ./keymaps.nix
    ./open.nix
    ./plugins.nix
    ./theme.nix
  ];

  config = lib.mkIf config.customPrograms.terminal.fish.enable {
    programs.yazi = {
      enable = true;
      package = inputs'.yazi.packages.yazi;

      enableFishIntegration = config.customPrograms.terminal.fish.enable;
    };
  };
}
