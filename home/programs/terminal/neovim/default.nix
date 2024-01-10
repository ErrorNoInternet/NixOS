{
  config,
  inputs,
  lib,
  pkgs,
  self,
  ...
}: {
  imports = [
    ./autocmd.nix
    ./development.nix
    ./extras.nix
    ./highlights.nix
    ./keymaps.nix
    ./lsp.nix
    ./options.nix
    ./shortcuts.nix
    ./visual.nix
    inputs.nixvim.homeManagerModules.nixvim
  ];

  config = lib.mkIf config.home.programs.terminal.fish.enable {
    programs.nixvim = {
      enable = true;
      package = self.packages.${pkgs.system}.neovim;
      defaultEditor = true;
    };
  };
}
