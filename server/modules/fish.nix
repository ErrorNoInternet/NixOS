{ pkgs, ... }:

{
  programs.fish.enable = true;
  environment.shells = [ pkgs.fish ];
  users.users.snowflake.shell = pkgs.fish;
}
