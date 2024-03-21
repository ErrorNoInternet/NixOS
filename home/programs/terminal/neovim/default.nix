{
  config,
  inputs,
  lib,
  self',
  ...
}: let
  cfg = config.customPrograms.terminal.neovim;
  inherit (lib) mkEnableOption mkIf;
in {
  imports = [
    ./development.nix
    ./extras.nix
    ./filetypes.nix
    ./formatting.nix
    ./highlights.nix
    ./keymaps
    ./lsp.nix
    ./options.nix
    ./shortcuts.nix
    ./visual.nix
    inputs.nixvim.homeManagerModules.nixvim
  ];

  options.customPrograms.terminal.neovim.enable =
    mkEnableOption "" // {default = config.customPrograms.terminal.fish.enable;};

  config = mkIf cfg.enable {
    programs.nixvim = {
      enable = true;
      package = self'.packages.neovim;
      defaultEditor = true;
      enableMan = false;
    };
  };
}
