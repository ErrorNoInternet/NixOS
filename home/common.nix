{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./profiles
    ../shared/caches

    ./modules
    ./programs
    inputs.agenix.homeManagerModules.default
  ];

  specialisation.outside.configuration = {
    caches.ErrorNoBinaries = {
      internal = false;
      external = true;
    };
  };

  home.packages = with pkgs; [
    cmatrix
    croc
    dua
    eza
    fd
    inputs.hsize.packages.${system}.hsize
    jq
    nh
    progress
  ];

  programs.man.generateCaches = false;
  manual.manpages.enable = false;

  home.stateVersion = "23.05";
}
