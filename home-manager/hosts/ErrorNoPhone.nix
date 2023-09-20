{ config, lib, pkgs, ... }:

{
    imports = [
        ../modules/bat.nix
        ../modules/nix-on-droid/zsh.nix
        ../modules/nvim.nix
        ../modules/tmux.nix
        ../modules/zoxide.nix
    ];
}
