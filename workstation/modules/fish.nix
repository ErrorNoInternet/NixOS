{ pkgs, ... }:

{
  programs.fish.enable = true;
  environment.shells = [ pkgs.fish ];
  users.users.ryan.shell = pkgs.fish;
}
