{ config, inputs, pkgs, ... }:

{
    imports = [
        ../modules/bat.nix
        ../modules/btop.nix
        ../modules/fastfetch.nix
        ../modules/nvim.nix
        ../modules/tmux.nix
        ../modules/zoxide.nix
        ../modules/zsh.nix
    ];

    home.username = "snowflake";
    home.homeDirectory = "/home/snowflake";

    home.packages = with pkgs; [
        # rice
        fastfetch
        cmatrix

        # system utilities
        (import ../derivations/hsize.nix { inherit pkgs; })
        duf
        eza
        jq
        nmap
        nvtop
        timg

        # development utilities
        python3
        rustup
        gcc
        python310Packages.bpython
    ];
}
