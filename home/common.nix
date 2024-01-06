{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./terminal/bat.nix
    ./terminal/comma.nix
    ./terminal/fastfetch.nix
    ./terminal/fish
    ./terminal/neovim
    ./terminal/tmux.nix
    ./terminal/yazi
    ./terminal/zoxide.nix
    inputs.nix-colors.homeManagerModules.default
    inputs.nixvim.homeManagerModules.nixvim
  ];

  home = {
    packages = with pkgs; [
      cmatrix
      croc
      dua
      eza
      fd
      inputs.hsize.packages.${pkgs.system}.hsize
      jq
      nh
      progress
    ];
    stateVersion = "23.05";
  };

  programs.man.generateCaches = false;
  manual.manpages.enable = false;
}