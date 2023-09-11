{ config, pkgs, ... }:

{
    system.stateVersion = "23.05";
    environment.sessionVariables.HOSTNAME = "ErrorNoPhone";

    environment.motd = "";
    user.shell = "${pkgs.zsh}/bin/zsh";
    environment.packages = with pkgs; [
        cmatrix
        neofetch

#        (import ./nixos-repository/home-manager/derivations/hsize.nix {})
        exa
        git
        tput
        perl
        gawk
        wget
        curl

        gcc
        python3
        rustup
    ];
    home-manager = {
        config = ./nixos-repository/home-manager/home.nix;
        useUserPackages = true;
    };
}
