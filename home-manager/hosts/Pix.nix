{ config, inputs, pkgs }:

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
    inputs.hsize.packages.${pkgs.system}.hsize
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
