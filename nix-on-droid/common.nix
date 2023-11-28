{
  inputs,
  pkgs,
  ...
}: {
  system.stateVersion = "23.05";
  environment.motd = "";

  user.shell = "${pkgs.fish}/bin/fish";
  environment.packages = with pkgs; [
    neofetch

    croc
    curl
    dig
    dua
    eza
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
  ];
  home-manager = {
    config = ../home-manager/base.nix;
    useUserPackages = true;
  };
}
