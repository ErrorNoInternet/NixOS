{inputs, ...}: let
  custom = {
    predefinedColorScheme = "Nord";
    terminal = "foot";
  };
in {
  _module.args = {inherit custom;};
  imports = [
    ../common.nix
    ../profiles/development.nix
    ../terminal/git.nix
  ];

  colorScheme = inputs.nix-colors.colorSchemes.nord;
}
