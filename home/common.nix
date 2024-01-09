{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./modules
    ./programs/terminal/bat.nix
    ./programs/terminal/comma.nix
    ./programs/terminal/fastfetch.nix
    ./programs/terminal/fish
    ./programs/terminal/neovim
    ./programs/terminal/tmux.nix
    ./programs/terminal/yazi
    ./programs/terminal/zoxide.nix
    inputs.agenix.homeManagerModules.default
    inputs.nixvim.homeManagerModules.nixvim
  ];

  home = {
    stateVersion = "23.05";
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
  };

  programs.man.generateCaches = false;
  manual.manpages.enable = false;
}
