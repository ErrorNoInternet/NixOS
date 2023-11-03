{ inputs, pkgs, ... }:

{
  system.stateVersion = "23.05";
  environment.motd = "";

  user.shell = "${pkgs.fish}/bin/fish";
  environment.packages = with pkgs; [
    cmatrix
    neofetch

    croc
    curl
    dig
    eza
    fastfetch
    gawk
    git
    gnugrep
    gnupg
    gnutar
    gzip
    inputs.hsize.packages.${pkgs.system}.hsize
    iproute2
    ncurses
    nmap
    openssh
    perl
    procps
    wget
    which

    gcc
    python3
    rustup
  ];
  home-manager = {
    config = ../home-manager/base.nix;
    useUserPackages = true;
  };
}
