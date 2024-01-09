{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ../common.nix
    ../programs/terminal/btop.nix
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
