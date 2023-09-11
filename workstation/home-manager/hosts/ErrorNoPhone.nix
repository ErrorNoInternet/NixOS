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

    environment.packages = with pkgs; [
        fastfetch
        cmatrix

        exa
        (import ../derivations/hsize.nix {})

        python3
        rustup
        gcc
    ];

    home.stateVersion = "23.05";
}
