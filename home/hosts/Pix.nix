{pkgs, ...}: {
  home = {
    username = "snowflake";
    homeDirectory = "/home/snowflake";
    packages = with pkgs; [
      # system utilities
      nmap
    ];
  };
}
