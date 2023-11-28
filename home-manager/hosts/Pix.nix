{
  inputs,
  pkgs,
  ...
}: let
  custom = {
    predefinedColorScheme = "Nord";
  };
in {
  _module.args = {inherit custom;};
  imports = [
    ./common.nix
    ../profiles/development
    ../programs/btop.nix
    ../programs/fastfetch.nix
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
