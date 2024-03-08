{
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
    config.flags.nixOnDroid = true;
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
        htop
        iproute2
        kbd
        less
        nano
        ncurses
        neofetch
        openssh
        perl
        procps
        util-linux
        which
        xz
        zstd
      ]
      ++ (import ../shared/packages.nix {inherit pkgs self';});

    etc.current.source = lib.cleanSource ./..;
  };

  system.stateVersion = "23.05";
}
