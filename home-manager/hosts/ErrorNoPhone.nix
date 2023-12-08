{inputs, ...}: let
  custom = {
    predefinedColorScheme = "Nord";
    terminal = "foot";
  };
in {
  _module.args = {inherit custom;};
  imports = [
    ../profiles/development
    ../programs/git.nix
    ./common.nix
  ];

  colorScheme = inputs.nix-colors.colorSchemes.nord;
}
