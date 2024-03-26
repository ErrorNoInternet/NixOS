{
  inputs',
  inputs,
  lib,
  pkgs,
  self',
  ...
}: {
  imports = [
    ./caches
    ./profiles
    ./terminal.nix
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    config.flags.isNixOnDroid = true;
  };

  environment.motd = "";
  nix = {
    package = self'.packages.nix;

    nixPath = ["nixpkgs=${inputs.nixpkgs}"];
    registry = let
      mappedRegistry = lib.mapAttrs' (name: flake:
        lib.nameValuePair name {inherit flake;})
      inputs;
    in
      mappedRegistry // {default = mappedRegistry.nixpkgs;};

    extraOptions = ''
      experimental-features = nix-command flakes
      flake-registry =
      log-lines = 500
      show-trace = true
    '';
  };

  user.shell = "${pkgs.fish}/bin/fish";
  environment = {
    packages = with pkgs;
      [
        gawk
        glibc
        gnugrep
        gnupg
        gnused
        gnutar
        gzip
        inetutils
        iproute2
        kbd
        less
        nano
        ncurses
        neofetch
        openssh
        perl
        procps
        rsync
        util-linux
        which
        xz
        zstd
      ]
      ++ (import ../shared/packages.nix {inherit inputs' pkgs self';});

    etc.current.source = lib.cleanSource ./..;
  };

  system.stateVersion = "23.05";
}
