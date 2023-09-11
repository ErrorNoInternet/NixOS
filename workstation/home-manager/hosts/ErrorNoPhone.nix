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

    home.packages = [
        pkgs.fastfetch
        pkgs.cmatrix

        pkgs.exa
        (import ../derivations/hsize.nix {})

        pkgs.python3
        pkgs.rustup
        pkgs.gcc
    ];

    home.stateVersion = "23.05";
}
