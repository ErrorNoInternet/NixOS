{ config, lib, pkgs }:

{
    imports = [
        ../modules/bat.nix
        ../modules/nix-on-droid/zsh.nix
        ../modules/neovim.nix
        ../modules/tmux.nix
        ../modules/zoxide.nix
    ];
}
