{
  config,
  inputs,
  lib,
  pkgs,
  self,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
in {
  imports = [
    ./autocmd.nix
    ./development.nix
    ./extras.nix
    ./highlights.nix
    ./keymaps
    ./lsp.nix
    ./options.nix
    ./shortcuts.nix
    ./visual.nix
    inputs.nixvim.homeManagerModules.nixvim
  ];

  options.home.programs.terminal.neovim.enable =
    mkEnableOption ""
    // {
      default = config.home.programs.terminal.fish.enable;
    };

  config = mkIf config.home.programs.terminal.neovim.enable {
    programs.nixvim = {
      enable = true;
      package = self.packages.${pkgs.system}.neovim;
      defaultEditor = true;
    };
  };
}
