{
  inputs,
  pkgs,
  ...
}: let
  custom = {
    predefinedColorScheme = "Nord";
  };
in {
  _module.args = {inherit custom;};
  imports = [
    ../modules/bat.nix
    ../modules/btop.nix
    ../modules/fastfetch.nix
    ../modules/fish.nix
    ../modules/neovim.nix
    ../modules/tmux.nix
    ../modules/yazi.nix
    ../modules/zoxide.nix
    ../modules/zsh.nix
    inputs.nix-colors.homeManagerModules.default
  ];

  colorScheme = inputs.nix-colors.colorSchemes.nord;
  home.username = "snowflake";
  home.homeDirectory = "/home/snowflake";

  home.packages = with pkgs; [
    # rice
    fastfetch
    cmatrix

    # system utilities
    croc
    eza
    inputs.hsize.packages.${pkgs.system}.hsize
    jq
    nmap
    timg

    # development utilities
    python3
    rustup
    gcc
    python310Packages.bpython
  ];
}
