{ config, pkgs, secrets }:

{
    imports = [
        ../modules/bat.nix
        ../modules/nix-on-droid/zsh.nix
        ../modules/nvim.nix
        ../modules/tmux.nix
        ../modules/zoxide.nix
    ];

    home.stateVersion = "23.05";
}
