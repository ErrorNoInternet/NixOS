{
  config,
  inputs,
  lib,
  ...
}: let
  cfg = config.customPrograms.neovim;
  inherit (lib) mkEnableOption mkIf;
in {
  imports = [
    ./cmp.nix
    ./dap.nix
    ./development.nix
    ./extras.nix
    ./filetypes.nix
    ./formatting.nix
    ./highlights
    ./highlights
    ./keymaps
    ./lsp.nix
    ./options.nix
    ./shortcuts.nix
    ./visual.nix
    inputs.nixvim.homeManagerModules.nixvim
  ];

  options.customPrograms.neovim.enable =
    mkEnableOption "" // {default = config.customPrograms.fish.enable;};

  config = mkIf cfg.enable {
    programs.nixvim = {
      enable = true;
      defaultEditor = true;
      enableMan = false;
    };
  };
}
