{
  config,
  lib,
  pkgs,
  self,
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
      package = self.legacyPackages.${pkgs.system}.yazi;

      enableFishIntegration = config.home.programs.terminal.fish.enable;
    };
  };
}
