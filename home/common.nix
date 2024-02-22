{
  config,
  inputs',
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ../shared/caches
    ./modules
    ./profiles
    ./programs
    inputs.agenix.homeManagerModules.default
  ];

  age.identityPaths = [
    "/home/${config.home.username}/.ssh/id_ed25519_agenix"
  ];

  specialisation.outside.configuration = {
    caches.errornobinaries = {
      internal = false;
      external = true;
    };
  };

  home = {
    packages = with pkgs; [
      cmatrix
      croc
      eza
      fd
      inputs'.hsize.packages.hsize
      jq
      nh
      progress
    ];

    stateVersion = "23.05";
  };
}
