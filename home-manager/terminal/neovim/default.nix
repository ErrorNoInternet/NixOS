{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./autocmd.nix
    ./development.nix
    ./extra.nix
    ./globals.nix
    ./highlights.nix
    ./keymaps.nix
    ./lsp.nix
    ./options.nix
    ./shortcuts.nix
    ./ui.nix
  ];

  programs.nixvim = {
    enable = true;
    package = inputs.neovim.packages.${pkgs.system}.neovim;
    defaultEditor = true;
  };
}
