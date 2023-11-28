{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.nix-colors.homeManagerModules.default
    ../programs/bat.nix
    ../programs/comma.nix
    ../programs/fastfetch.nix
    ../programs/fish.nix
    ../programs/neovim.nix
    ../programs/tmux.nix
    ../programs/yazi.nix
    ../programs/zoxide.nix
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
  };
}
