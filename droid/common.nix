{
  config,
  inputs',
  inputs,
  lib,
  pkgs,
  self',
  ...
}: {
  imports = [
    ./caches
    ./modules
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
    nixPath = ["nixpkgs=${inputs.nixpkgs}"];

    extraOptions = ''
      experimental-features = nix-command flakes
      flake-registry =
      log-lines = 500
      show-trace = true
    '';
  };

  networking.extraHosts = lib.strings.concatStringsSep "\n" (lib.attrsets.mapAttrsToList (
    name: host: "${host} ${name}"
  ) (import ../shared/hostnames.nix));

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
      ++ (import ../shared/packages.nix {
        inherit config inputs' pkgs self';
      });

    etc.current.source = lib.cleanSource ./..;
  };
}
