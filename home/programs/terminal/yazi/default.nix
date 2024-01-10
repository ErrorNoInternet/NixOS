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

  config = lib.mkIf config.customPrograms.terminal.fish.enable {
    programs.yazi = {
      enable = true;
      package = inputs.yazi.packages.${pkgs.system}.yazi;
      enableFishIntegration = true;
      enableZshIntegration = true;
    };
  };
}
