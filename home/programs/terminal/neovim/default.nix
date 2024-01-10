{
  config,
  inputs,
  lib,
  pkgs,
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

  config = lib.mkIf config.customPrograms.terminal.fish.enable {
    programs.nixvim = {
      enable = true;
      package = inputs.neovim.packages.${pkgs.system}.neovim.overrideAttrs (oldAttrs: {
        patches =
          (oldAttrs.patches or [])
          ++ [
            ../../../../packages/patches/neovim_no-fold-numbers.patch
          ];
      });
      defaultEditor = true;
    };
  };
}
