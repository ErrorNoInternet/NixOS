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
      eza
    ];
    sessionVariables = {
      TERMINAL = "kitty";
      BROWSER = "firefox";
    };
  };
}
