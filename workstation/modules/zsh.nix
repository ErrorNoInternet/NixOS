{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
  };
  environment.shells = [ pkgs.zsh ];
  users.users.ryan.shell = pkgs.zsh
}
