{
  inputs,
  pkgs,
  ...
}: {
  system.stateVersion = "23.05";
  environment.motd = "";

  user.shell = "${pkgs.fish}/bin/fish";
  environment.packages = with pkgs; [
    cmatrix
    neofetch

    croc
    curl
    dig
    dua
    eza
    fastfetch
    fd
    file
    gawk
    glibc
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
    procs
    ripgrep
    wget
    which
    xxd

    gcc
    go
    python3
    rustup
  ];
  home-manager = {
    config = ../home-manager/base.nix;
    useUserPackages = true;
  };
}
