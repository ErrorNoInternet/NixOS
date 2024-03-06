{pkgs, ...}: {
  customPrograms.terminal.git.user.name = "Pix";

  home = {
    packages = with pkgs; [
      nmap
    ];

    username = "snowflake";
    homeDirectory = "/home/snowflake";
  };
}
