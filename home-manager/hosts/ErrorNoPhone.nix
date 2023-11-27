{inputs, ...}: let
  custom = {
    predefinedColorScheme = "Nord";
  };
in {
  _module.args = {inherit custom;};
  imports = [
    ../modules/bat.nix
    ../modules/comma.nix
    ../modules/fastfetch.nix
    ../modules/fish.nix
    ../modules/git.nix
    ../modules/neovim.nix
    ../modules/nix-on-droid/zsh.nix
    ../modules/tmux.nix
    ../modules/yazi.nix
    ../modules/zoxide.nix
    inputs.nix-colors.homeManagerModules.default
  ];

  colorScheme = inputs.nix-colors.colorSchemes.nord;
}
