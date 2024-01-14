{pkgs, ...}: {
  imports = [
    ./caches
    ./profiles
  ];

  environment.motd = "";
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  user.shell = "${pkgs.fish}/bin/fish";
  environment.packages = with pkgs; [
    neofetch

    curl
    dig
    file
    gawk
    glibc
    gnugrep
    gnupg
    gnutar
    gzip
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
    useGlobalPkgs = true;
    useUserPackages = true;
    config.home = {
      flags.nixOnDroid = true;
      stateVersion = "23.05";
    };
  };
  system.stateVersion = "23.05";
}
