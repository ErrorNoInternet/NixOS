{
  inputs,
  pkgs,
  ...
}: let
  custom = {
    hostname = "Pix";
    terminal = "foot";
  };
in {
  _module.args = {inherit custom;};
  imports = [
    ../common.nix
    ../locations/china.nix
    ../profiles/development
    ../terminal/btop.nix
    inputs.agenix.homeManagerModules.default
  ];

  colors = {
    schemeName = "Nord";
    scheme = inputs.nix-colors.colorSchemes.nord;
  };

  caches = {
    ErrorNoBinaries = {
      enable = true;
      internal = true;
      external = false;
      cachix = true;
    };
    nix-community.enable = true;
  };

  home = {
    username = "snowflake";
    homeDirectory = "/home/snowflake";
    packages = with pkgs; [
      # system utilities
      nmap
    ];
  };
}
