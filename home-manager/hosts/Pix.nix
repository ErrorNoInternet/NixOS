{
  inputs,
  pkgs,
  ...
}: let
  custom = {
    predefinedColorScheme = "Nord";
    terminal = "foot";
  };
in {
  _module.args = {inherit custom;};
  imports = [
    ../../shared/caches/ErrorNoBinaries.nix
    ../../shared/caches/nix-community.nix
    ../common.nix
    ../locations/china.nix
    ../profiles/development
    ../terminal/btop.nix
    inputs.agenix.homeManagerModules.default
  ];

  colorScheme = inputs.nix-colors.colorSchemes.nord;
  home = {
    username = "snowflake";
    homeDirectory = "/home/snowflake";
    packages = with pkgs; [
      # system utilities
      nmap
    ];
  };
}
