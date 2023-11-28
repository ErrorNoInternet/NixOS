{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.nix-colors.homeManagerModules.default
    ../programs/bat.nix
    ../programs/neovim.nix
    ../programs/fish.nix
    ../programs/tmux.nix
    ../programs/zoxide.nix
    ../programs/yazi.nix
  ];

  home = {
    packages = with pkgs; [
      cmatrix
      croc
      eza
      fd
      dua
      jq
      inputs.hsize.packages.${pkgs.system}.hsize
    ];
    sessionVariables = {
      TERMINAL = "kitty";
      BROWSER = "firefox";
    };
  };
}
