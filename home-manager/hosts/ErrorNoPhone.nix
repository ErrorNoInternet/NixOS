{ inputs, ... }:

let
  custom = {
    predefinedColorScheme = "Nord";
  };
in
{
  _module.args = { inherit custom; };
  imports = [
    ../modules/bat.nix
    ../modules/nix-on-droid/zsh.nix
    ../modules/neovim.nix
    ../modules/tmux.nix
    ../modules/zoxide.nix
    inputs.nix-colors.homeManagerModules.default
  ];

  colorScheme = inputs.nix-colors.colorSchemes.nord;
}
