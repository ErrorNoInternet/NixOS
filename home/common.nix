{
  config,
  inputs',
  inputs,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkDefault;
in {
  imports = [
    ../packages/module.nix
    ../shared/caches
    ./modules
    ./profiles
    ./programs
    inputs.agenix.homeManagerModules.default
  ];

  specialisation.outside.configuration = {
    caches.errornobinaries = {
      internal = false;
      external = true;
    };
  };

  age.identityPaths = [
    "/home/${config.home.username}/.ssh/id_ed25519_agenix"
  ];

  home = rec {
    packages = with pkgs; [
      cmatrix
      croc
      eza
      inputs'.hsize.packages.default
      jq
      mergerfs
      nh
      progress
      try
    ];

    username =
      mkDefault
      (
        if config.flags.isWorkstation
        then "error"
        else "snowflake"
      );
    homeDirectory = mkDefault "/home/${username}";

    stateVersion = "23.05";
  };
}
