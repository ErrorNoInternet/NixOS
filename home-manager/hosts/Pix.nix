{ inputs, pkgs, ... }:

let
  custom = {
    predefinedColorScheme = "Nord";
  };
in
{
  _module.args = { inherit custom; };
  imports = [
    ../modules/bat.nix
    ../modules/btop.nix
    ../modules/fastfetch.nix
    ../modules/neovim.nix
    ../modules/tmux.nix
    ../modules/zoxide.nix
    ../modules/zsh.nix
    ../modules/yazi.nix
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
