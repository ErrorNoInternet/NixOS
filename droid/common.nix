{
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
  nix.extraOptions = ''
    experimental-features = nix-command flakes
    auto-optimise-store = true
  '';

  user.shell = "${pkgs.fish}/bin/fish";
  environment.packages = with pkgs; [
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
    neofetch
    nmap
    perl
    procps
    procs
    ripgrep
    self'.packages.hwatch
    wget
    which
    xxd
  ];

  system.stateVersion = "23.05";
}
