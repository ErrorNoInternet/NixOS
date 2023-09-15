{ config, lib, pkgs, ... }:

{
    imports = [
        ../modules/bat.nix
        ../modules/nix-on-droid/zsh.nix
        ../modules/nix-on-droid/nvim.nix
        ../modules/tmux.nix
        ../modules/zoxide.nix
    ];

    home.stateVersion = "23.05";
}
