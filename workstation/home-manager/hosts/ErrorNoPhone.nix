{ config, pkgs, secrets }:

{
    imports = [
        ../modules/fastfetch.nix
        ../modules/nvim.nix
        ../modules/tmux.nix
        ../modules/zsh.nix
        ../modules/zoxide.nix
        ../modules/bat.nix
    ];

    home.stateVersion = "23.05";
}
