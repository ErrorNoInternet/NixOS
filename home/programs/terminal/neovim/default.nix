{
  config,
  inputs,
  lib,
  self',
  ...
}:
let
  cfg = config.customPrograms.terminal.neovim;
  inherit (lib) mkEnableOption mkIf;
in
{
  imports = [
    ./autocmd.nix
    ./development.nix
    ./extras.nix
    ./highlights.nix
    ./keymaps
    ./lsp.nix
    ./options.nix
    ./shortcuts.nix
    ./theme.nix
    inputs.nixvim.homeManagerModules.nixvim
  ];

  options.customPrograms.terminal.neovim.enable = mkEnableOption "" // {
    default = config.customPrograms.terminal.fish.enable;
  };

  config = mkIf cfg.enable {
    programs.nixvim = {
      enable = true;
      package = self'.packages.neovim;
      defaultEditor = true;
      enableMan = false;
    };
  };
}
