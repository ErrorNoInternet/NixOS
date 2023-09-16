{ pkgs, ... }:

{
    system.stateVersion = "23.05";
    environment.motd = "";

    user.shell = "${pkgs.zsh}/bin/zsh";
    environment.packages = with pkgs; [
        cmatrix
        neofetch

        (import ../home-manager/derivations/hsize.nix { inherit pkgs; })
        curl
        eza
        gawk
        dig
        git
        gnugrep
        gnupg
        gnutar
        gzip
        ncurses
        nmap
        openssh
        perl
        unixtools.ping
        wget

        gcc
        python3
        rustup
    ];
    home-manager = {
        config = ../home-manager/hosts/ErrorNoPhone.nix;
        useUserPackages = true;
    };
}
