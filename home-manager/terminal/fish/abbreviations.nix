{
  imports = [
    ./git-abbreviations.nix
  ];

  programs.fish.shellAbbrs = {
    s = "sudo";
    nv = "nvim";

    nd = "nix develop -c fish";
    nr = "nix run";
    ns = "nix shell";
  };
}
