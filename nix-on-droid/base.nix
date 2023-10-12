{ inputs, pkgs }:

{
  system.stateVersion = "23.05";
  environment.motd = "";

  user.shell = "${pkgs.zsh}/bin/zsh";
  environment.packages = with pkgs; [
    cmatrix
    neofetch

    # unixtools.ping
    croc
    curl
    dig
    eza
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
    wget

    gcc
    python3
    rustup
  ];
  home-manager = {
    config = ../home-manager/base.nix;
    useUserPackages = true;
  };
}
