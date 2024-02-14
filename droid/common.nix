{
  pkgs,
  self',
  ...
}: {
  imports = [
    ./caches
    ./profiles
  ];

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
