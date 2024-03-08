{pkgs, ...}: {
  customPrograms.terminal.git.user.name = "Pix";

  home = {
    username = "snowflake";
    homeDirectory = "/home/snowflake";
  };
}
