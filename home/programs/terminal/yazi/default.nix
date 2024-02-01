{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./keymaps.nix
    ./open.nix
    ./visual.nix
  ];

  config = lib.mkIf config.home.programs.terminal.fish.enable {
    programs.yazi = {
      enable = true;
      package = inputs.yazi.packages.${pkgs.system}.yazi;

      enableFishIntegration = config.home.programs.terminal.fish.enable;
    };
  };
}
