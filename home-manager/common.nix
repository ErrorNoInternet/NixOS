{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.nix-colors.homeManagerModules.default
    ./terminal/bat.nix
    ./terminal/comma.nix
    ./terminal/fastfetch.nix
    ./terminal/fish.nix
    ./terminal/neovim.nix
    ./terminal/tmux.nix
    ./terminal/yazi.nix
    ./terminal/zoxide.nix
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
      progress
    ];
    stateVersion = "23.05";
  };
}
