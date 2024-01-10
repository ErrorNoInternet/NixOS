{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ../shared/caches
    ./modules
    ./programs
    inputs.agenix.homeManagerModules.default
  ];

  caches = {
    ErrorNoBinaries.enable = true;
    nix-community.enable = true;
  };

  home.packages = with pkgs; [
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

  programs.man.generateCaches = false;
  manual.manpages.enable = false;

  home.stateVersion = "23.05";
}
