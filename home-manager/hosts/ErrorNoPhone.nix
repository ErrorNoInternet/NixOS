{inputs, ...}: let
  custom = {
    hostname = "ErrorNoPhone";
    predefinedColorScheme = "Nord";
    terminal = "foot";
  };
in {
  _module.args = {inherit custom;};
  imports = [
    ../common.nix
    ../profiles/development
    ../terminal/git.nix
  ];

  colorScheme = inputs.nix-colors.colorSchemes.nord;
}
