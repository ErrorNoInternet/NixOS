{
  imports = [
    ./git.nix
    ./nix.nix
  ];

  programs.fish.shellAbbrs = {
    s = "sudo";
    nv = "nvim";
  };
}
