{
  inputs,
  pkgs,
  ...
}: {
  colors = {
    schemeName = "Nord";
    scheme = inputs.nix-colors.colorSchemes.nord;
  };

  caches.ErrorNoBinaries.external = false;

  home = {
    username = "snowflake";
    homeDirectory = "/home/snowflake";
    packages = with pkgs; [
      # system utilities
      nmap
    ];
  };
}
