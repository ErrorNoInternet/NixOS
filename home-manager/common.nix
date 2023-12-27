{
  inputs,
  pkgs,
  config,
  ...
}: {
  imports = [
    ./terminal/bat.nix
    ./terminal/comma.nix
    ./terminal/fastfetch.nix
    ./terminal/fish.nix
    ./terminal/neovim
    ./terminal/tmux.nix
    ./terminal/yazi.nix
    ./terminal/zoxide.nix
    inputs.nix-colors.homeManagerModules.default
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
    stateVersion = "23.05" ;
  };
}
