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

  home = {
    packages = with pkgs; [
      cmatrix
      croc
      eza
      fd
      inputs'.hsize.packages.hsize
      jq
      mergerfs
      nh
      progress
      try
    ];

    stateVersion = "23.05";
  };
}
