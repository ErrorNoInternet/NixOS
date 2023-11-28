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
  home.username = "snowflake";
  home.homeDirectory = "/home/snowflake";

  home.packages = with pkgs; [
    # rice
    fastfetch

    # system utilities
    croc
    inputs.hsize.packages.${pkgs.system}.hsize
    jq
    nmap
    timg
  ];
}
