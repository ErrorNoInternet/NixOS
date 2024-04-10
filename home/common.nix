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
    ../shared/caches
    ../shared/modules
    ./modules
    ./profiles
    ./programs
    inputs.agenix.homeManagerModules.default
  ];

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
